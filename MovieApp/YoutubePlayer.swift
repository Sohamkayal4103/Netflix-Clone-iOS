//
//  YoutubePlayer.swift
//  MovieApp
//
//  Created by Soham Kayal on 1/11/26.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let videoId: String
    private let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    // Use a stable HTTPS origin for the embedded document.
    private let originURL = URL(string: "https://movieapp.local")!

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: config)
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        // Build the embed URL (fallback to standard embed base if not configured)
        let base = youtubeBaseURL ?? "https://www.youtube.com/embed/"
        guard let baseURL = URL(string: base) else { return }

        let embedURL = baseURL.appending(path: videoId)
        var components = URLComponents(url: embedURL, resolvingAgainstBaseURL: false) ?? URLComponents()
        var items = components.queryItems ?? []
        items.append(URLQueryItem(name: "playsinline", value: "1"))
        items.append(URLQueryItem(name: "rel", value: "0"))
        items.append(URLQueryItem(name: "modestbranding", value: "1"))
        items.append(URLQueryItem(name: "origin", value: originURL.absoluteString))
        components.queryItems = items

        guard let finalURL = components.url else { return }

        let html = """
        <!doctype html>
        <html>
          <head>
            <meta name=\"viewport\" content=\"initial-scale=1, width=device-width\">
            <style>
              html, body { margin: 0; height: 100%; background: #000; }
              #wrap { position: fixed; inset: 0; }
              iframe { width: 100%; height: 100%; border: 0; display: block; }
            </style>
          </head>
          <body>
            <div id=\"wrap\">
              <iframe
                src=\"\(finalURL.absoluteString)\"
                title=\"YouTube player\"
                allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\"
                allowfullscreen
                referrerpolicy=\"origin-when-cross-origin\">
              </iframe>
            </div>
          </body>
        </html>
        """

        webView.loadHTMLString(html, baseURL: originURL)
    }
}
