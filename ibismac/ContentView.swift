import SwiftUI
import WebKit

struct ContentView: View {
    @State private var urlInput = ""
    
    var body: some View {
        HStack {
            TextField("Search or Enter URL...", text: $urlInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .autocorrectionDisabled(true)
        }
        Webview(url: URL(string: "https://developer.apple.com")!)
    }
}

struct Webview: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateNSView(_ webView: WKWebView, context: Context) {}
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
 
