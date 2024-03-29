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
    
    @State private var urlString: String = "Enter URL or Search"
    @State private var url: URL =  URL(string:"https://en.wikipedia.org/wiki/Ibis")!
    @State private var urlHover: Bool = false
    @State private var barHover: Bool = false
    
    func loadURL() {
        if let url = URL(string: urlString) {
            self.url = url
        }
    }
    
    
    var body: some View {
        WebView(url: $url)
            .padding(.horizontal, 7)
            .overlay(
                Rectangle()
                    .fill(Color.red)
                    .frame(height: urlHover ? 40:15)
                    .onHover { hovering in urlHover = hovering
                    },
                alignment: .top
                
            )
            .overlay(alignment: .top) {
                if urlHover || barHover {
                    ZStack {
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
                            
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height: 30)
                                .onHover { hovering in barHover = hovering }
                                .allowsHitTesting(false)
                        }
                        .onHover { hovering in
                            barHover = hovering
                            urlHover = hovering
                        }
                        .padding(.horizontal)
                        .transition(.move(edge: .top))
                        .animation(.easeInOut(duration: 0.3))
                    }
                    }
            }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
