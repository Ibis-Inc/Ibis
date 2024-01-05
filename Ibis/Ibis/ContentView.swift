import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    @Binding var url: URL
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.load(URLRequest(url: url))
    }
}

struct ContentView: View {
    
    @State private var urlString: String = "https://www.google.com"
    @State private var url: URL =  URL(string:"https://search.brave.com")!
    
    func loadURL() {
        if let url = URL(string: urlString) {
            self.url = url
        }
    }
    
    
    var body: some View {
        WebView(url: $url)
        .padding(.horizontal, 7)
        .overlay(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.ultraThinMaterial)
                    .frame(height: 30)
                    .padding(.vertical, 7)
                    .shadow(radius: 10)
                
                TextField("Enter URL Or Search", text: $urlString, onCommit: {
                    loadURL()
                })
                .textFieldStyle(.plain)
                .padding(.leading, 20)
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
