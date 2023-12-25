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
    @State private var url: URL =  URL(string:"https://www.google.com")!
    
    func loadURL() {
        if let url = URL(string: urlString) {
            self.url = url
        }
    }
    
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.accent.opacity(0.3))
                    .frame(height: 30)
                
                TextField("Enter URL Or Search", text: $urlString, onCommit: {
                    loadURL()
                })
                .textFieldStyle(.plain)
                .padding(.leading, 10)
                
            }
        }
        VStack {
            WebView(url: $url)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
