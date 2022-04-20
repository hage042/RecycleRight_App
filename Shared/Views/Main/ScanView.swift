//
//  ScanView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/16/22.
//

import SwiftUI
import AVFoundation
import Vision



struct ScanView: View {
    var body: some View {
        CameraView()
    
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}

struct CameraView: View {

    @State var predictionLabel = ""
    @State var contentHasScrolled = false
    
    @StateObject var camera = CameraModel()
    
    
    var body: some View{
        ZStack {
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                Button {
                } label: {
                    LabelButton(title: "")
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(50)
                //.ignoresSafeArea()
            }
        }
    
        .onAppear(perform: {
            camera.Check()
        })

        .overlay(NavigationBar(title: "Scanner", contentHasScrolled: $contentHasScrolled))
    
    }
    
}

class CameraModel: ObservableObject{
    
    @Published var session = AVCaptureSession()
    
    @Published var alert = false
    
    @Published var output = AVCapturePhotoOutput()
    
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    @State var predictionLabel = ""
    
    func Check(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case.notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
            }
        case.denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUp(){
        
        do{
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    func captureOutput( _ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
                // print("Camera was able to capture a frame:", Date())
                
                guard let pixelBuffer: CVPixelBuffer =
                    CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
                
                guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
                let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
                    
                    //perhaps check the err
                    
                    //print(finishedRequest.results)
                    
                    guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
                    
                    guard let firstObservation = results.first else { return }
                    
                    
                    print(firstObservation.identifier,
                          firstObservation.confidence)
                    
                    if (firstObservation.confidence > 0.75){
                        
                        //AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                        
                        let predictionString = ""
                        //if doesn't work change to let
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [self] in
                            
                            self.predictionLabel = predictionString + "\(firstObservation.identifier)"
                            
                            print(predictionString)
                        })
                    }
                    
                }
                
                try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
                
            }
            
    
}

struct CameraPreview: UIViewRepresentable{
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIView(frame: UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
