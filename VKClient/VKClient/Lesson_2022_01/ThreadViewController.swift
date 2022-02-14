//
//  ThreadViewController.swift
//  VKClient
//
//  Created by Dmitry Belov on 29.01.2022.
//

import UIKit

class ThreadViewController: UIViewController {
    
    var arrayString: [NSString] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //memoryLeak()
        //timerAsyncTask()
        //mainThread()
        //infinityLoop()
        
        runLoopBackgroundThread()
        
    }
    
    func runLoopBackgroundThread () {
        
        class TimeThread: Thread {
            override func main() {
                Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in print ("Tick")
                }
                RunLoop.current.run()
            }
        }
        
        let thread1 = TimeThread()
        thread1.start()
        //thread1.cancel()
    }
    
    func infinityLoop () {
        
        class InfinityLoop: Thread {
            override func main() {
                while true {
                    print("😈")
                }
            }
        }
        
        let thread1 = InfinityLoop()
        thread1.start()
        //thread1.cancel()
        
    }
   
    // MARK: - главный поток - mainThread
    func mainThread() {
        
        Thread.detachNewThread { //detach - отделяет потоки
            for _ in (0..<10) {
                print("😈")
                print(Thread.current) //вывести текущий(current) поток
            }
        }
        let thread1 = Thread {
            for _ in (0..<10) {
                print("🤡")
                print(Thread.current)
            }
        }
        thread1.start()
        
        for _ in (0..<10) {
            print("😇")
            print(Thread.current)
        }
    }
    
    // MARK: - асинхронная задача - timer
    func timerAsyncTask(){
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print("tisk")
            print(Date())
        }
    }
    // MARK: -  создаем утечку памяти (memoryLeak)
    func memoryLeak() {
        print("start test")
        
        for index in 0...UInt.max {
            autoreleasepool {//устраняет утечку памяти - контейнер освобождения памяти
                let string = NSString (format: "test + %d", index)
                print(string)
                
                arrayString.append(string)
            }
        }
        print("end test")
    }
}



