//
//  ContentView.swift
//  Teste
//
//  Created by Rafael Carvalho on 25/08/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        //Fazer o coordenator saber sobre a view:
        //Aqui você está passando esse arView local para a var do tipo view de Coordinator.
        context.coordinator.view = arView
        
        // Todos os eventos dessa ARView session vai ser delegada para coordinator, que por sua vez, tratará esses eventos.
        arView.session.delegate = context.coordinator
        
        
        //criar uma ancora horizontal
        let anchor = AnchorEntity(plane: .horizontal)
        
        // o box com material
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
        box.generateCollisionShapes(recursive: true)
        
        anchor.addChild(box)
        arView.scene.anchors.append(anchor)

        // Esse arView possúi um gestureRecognizer associado ao "Coordinator".
        return arView
        
    }
    
    // Essa func vem de UIViewReprsentable
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
