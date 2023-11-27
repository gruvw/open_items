'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/FontManifest.json": "9e15e49da37e0f54704d45b96bc28adf",
"assets/assets/icons/launcher/open_items_android_12.png": "af7ed327735cfddfca2c67f9038ae293",
"assets/assets/icons/launcher/open_items_favicon.svg": "adf5d49cdd213822f9643b2bc609ff42",
"assets/assets/icons/launcher/open_items.png": "ab2e623ad786bc5bccfa88be85f3ef66",
"assets/assets/icons/custom/OpenItemsIcons.otf": "38bf7357dead29b23621fde4c690e4ff",
"assets/fonts/MaterialIcons-Regular.otf": "3862c543c48caa17643225b714e0dc07",
"assets/AssetManifest.bin.json": "56d9271e8bf81ba2ee698af1dd7d49b1",
"assets/AssetManifest.bin": "bce0ce28f27ac87311632ce5edbd7357",
"assets/AssetManifest.json": "a29025a564690654f7430960c2040f53",
"assets/NOTICES": "e7b03a9676619301a785a72e72b31987",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "5e82d7b908e17a6b3b793503d6804a85",
"manifest.json": "e967b75fc8e9a497e51e2bb9139bcded",
"splash/img/light-3x.png": "4204ab9446e02873fe8fd14f3dc866cf",
"splash/img/dark-1x.png": "54d6f9f6fefb4adb20b3a86ac6cdb6be",
"splash/img/dark-4x.png": "d953ea258fe973dfc1e23c809c21a90b",
"splash/img/light-2x.png": "1bd5a71a8cb6377c5a5ca2fd055e5814",
"splash/img/dark-2x.png": "1bd5a71a8cb6377c5a5ca2fd055e5814",
"splash/img/light-4x.png": "d953ea258fe973dfc1e23c809c21a90b",
"splash/img/light-1x.png": "54d6f9f6fefb4adb20b3a86ac6cdb6be",
"splash/img/dark-3x.png": "4204ab9446e02873fe8fd14f3dc866cf",
"icons/Icon-maskable-192.png": "b474a91048478f0ca9af709d2f8d0f59",
"icons/Icon-512.png": "335eb6b1f9e3fbde36e9efe64a5613aa",
"icons/Icon-192.png": "b474a91048478f0ca9af709d2f8d0f59",
"icons/Icon-maskable-512.png": "335eb6b1f9e3fbde36e9efe64a5613aa",
"index.html": "0d121922e1d2e93ea32108f91c8c3b33",
"/": "0d121922e1d2e93ea32108f91c8c3b33",
"main.dart.js": "03028030e6321397ff6d06ab6bcbf11e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
