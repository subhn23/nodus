import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

void main() {
  group('SearchDao & FTS5 Full-Text Search TDD', () {
    late AppDatabase db;
    late SearchDao searchDao;

    setUp(() {
      db = AppDatabase.inMemory();
      searchDao = db.searchDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('indexes pages and performs live prefix full-text searches', () async {
      // 1. Index 3 sample pages
      await searchDao.indexPage(
        pageId: 'page-1',
        title: 'Kubernetes Cluster Architecture',
        bodyText: 'Configuring etcd and control plane high availability with flannel CNI networking.',
        tags: 'k8s, devops, cluster',
        codeSnippets: 'kubectl get nodes -o wide\nkubeadm init --pod-network-cidr=10.244.0.0/16',
      );

      await searchDao.indexPage(
        pageId: 'page-2',
        title: 'Docker Security Hardening',
        bodyText: 'Hardening container daemons and disabling root user in Dockerfile instructions.',
        tags: 'security, containers, docker',
        codeSnippets: 'docker run --cap-drop=ALL --read-only alpine:latest',
      );

      await searchDao.indexPage(
        pageId: 'page-3',
        title: 'WireGuard Mesh VPN Setup',
        bodyText: 'Setting up point-to-point WireGuard crypto tunnels across cloud servers.',
        tags: 'networking, vpn, wireguard',
        codeSnippets: 'wg-quick up wg0',
      );

      // Search prefix "kube" (should match "Kubernetes" and "kubectl")
      final kubeResults = await searchDao.search('kube');
      expect(kubeResults.length, equals(1));
      expect(kubeResults.first.pageId, equals('page-1'));
      expect(kubeResults.first.title, contains('Kubernetes'));
      expect(kubeResults.first.titleSnippet, contains('<b>Kubernetes</b>'));

      // Search "docker" (matches page-2)
      final dockerResults = await searchDao.search('docker');
      expect(dockerResults.length, equals(1));
      expect(dockerResults.first.pageId, equals('page-2'));

      // Search snippet in code
      final codeResults = await searchDao.search('read-only');
      expect(codeResults.length, equals(1));
      expect(codeResults.first.pageId, equals('page-2'));
      expect(codeResults.first.codeSnippet, contains('<b>read</b>-<b>only</b>'));
    });

    test('weights title matches higher than body matches in BM25 ranking', () async {
      // Page A has "Firewall" in the body only
      await searchDao.indexPage(
        pageId: 'page-a',
        title: 'Network Notes',
        bodyText: 'Setting up iptables firewall rules for traffic filtering.',
      );

      // Page B has "Firewall" in the TITLE
      await searchDao.indexPage(
        pageId: 'page-b',
        title: 'Firewall Configuration Guide',
        bodyText: 'General notes on network protection.',
      );

      final results = await searchDao.search('firewall');
      expect(results.length, equals(2));

      // With BM25 in SQLite, smaller (more negative) score indicates a higher rank match
      expect(results.first.pageId, equals('page-b'),
          reason: 'Title matches weighted 5.0x should rank first');
    });

    test('updates existing index entry without duplicate hits', () async {
      await searchDao.indexPage(
        pageId: 'page-1',
        title: 'Initial Title',
        bodyText: 'Old body text containing postgresql.',
      );

      var results = await searchDao.search('postgresql');
      expect(results.length, equals(1));

      // Update page with new content (replaces postgresql with redis)
      await searchDao.indexPage(
        pageId: 'page-1',
        title: 'Updated Title',
        bodyText: 'New body text containing redis in-memory cache.',
      );

      // Old search returns nothing
      results = await searchDao.search('postgresql');
      expect(results.isEmpty, isTrue);

      // New search finds updated document
      results = await searchDao.search('redis');
      expect(results.length, equals(1));
      expect(results.first.title, equals('Updated Title'));
    });

    test('removes deleted pages from the search index', () async {
      await searchDao.indexPage(
        pageId: 'page-1',
        title: 'Temporary Page',
        bodyText: 'Content to be purged.',
      );

      expect((await searchDao.search('Temporary')).length, equals(1));

      await searchDao.deletePageFromIndex('page-1');
      expect((await searchDao.search('Temporary')).isEmpty, isTrue);
    });
  });
}
