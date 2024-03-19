import SwiftUI

struct ContentView: View {
    @State private var isDetailed = false
    @Namespace private var namespace


    var body: some View {
        Group {
            if isDetailed {
                DetailContent()
            } else {
                MiniContent()
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

extension ContentView {
    @ViewBuilder
    private func MiniContent() -> some View {
        MiniButton().offset(x: 120, y: 350)
    }

    @ViewBuilder
    private func MiniButton() -> some View {
        Button {
            withAnimation { isDetailed.toggle() }
        } label: {
            Text("Open")
                .foregroundColor(.white)
                .padding()
                .font(.title3)
                .matchedGeometryEffect(id: "field", in: namespace)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .matchedGeometryEffect(
                            id: "background", in: namespace
                        )
                        .foregroundStyle(.blue)
                )
        }
    }
}

extension ContentView {
    @ViewBuilder
    private func DetailContent() -> some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .matchedGeometryEffect(id: "background", in: namespace)
                .frame(width: 300, height: 400)
                .foregroundStyle(.link)

            BackButton()
        }
    }

    @ViewBuilder
    private func BackButton() -> some View {
        Button {
            withAnimation { isDetailed.toggle() }
        } label: {
            Label("Back", systemImage: "arrowshape.backward.fill")
                .foregroundStyle(.white)
                .font(.title3)
                .padding()
                .fixedSize(horizontal: true, vertical: true)
                .matchedGeometryEffect(id: "field", in: namespace)
        }
    }
}

#Preview {
    ContentView()
}
