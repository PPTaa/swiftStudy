import UIKit

// Queue - Main, Global, Custom ++++++++++++++++++++++++++++++++++++

// main queue
DispatchQueue.main.async {
    // UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

// global queue
DispatchQueue.global(qos: .userInteractive).async {
    // 진짜 중요한 작업, 당장 중요
}
DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것, 사용자가 결과를 기다림
}
DispatchQueue.global(qos: .default).async {
    // 우선순위 신경 x
}
DispatchQueue.global(qos: .utility).async {
    // 시간이 조금 걸리는, 사용자가 기다리지 않는것 ex)네트워킹,큰파일 로딩
}
DispatchQueue.global(qos: .background).async {
    // 사용자 한테 당장 인식될 필요가 없는 것들, ex) 뉴스데이터 미리받기, 위치 업데이트, 영상다운 ...
}

// custom queue (자주 사용 x)
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)

// 복합적인 상황 ++++++++++++++++++++++++++++++++++++

func downloadImageFromServer() -> UIImage {
    //무거운 작업
    return UIImage()
}

func updateUI(image: UIImage){
    
}

DispatchQueue.global(qos: .background).async {
    // download image
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        // UI update
        updateUI(image: image)
    }
}

// Sync, Async ++++++++++++++++++++++++++++++++++++

// Async
DispatchQueue.global(qos: .background).async {
    for i in 0...6{
        print("async background : \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...6{
        print("async userInteractive : \(i)")
    }
}
// sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...6{
        print("sync background : \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...6{
        print("async userInteractive : \(i)")
    }
}
