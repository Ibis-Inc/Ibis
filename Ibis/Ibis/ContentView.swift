import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    func updateNSView(_ nsView: WKWebView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        VStack {
            WebView(url: URL(string: "https://www.google.com")!)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
