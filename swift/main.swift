import Foundation
import AppKit

func main() {
    print("start pid = \(getpid())")

    let forkPtr = dlsym(UnsafeMutableRawPointer(bitPattern: -2), "fork")
    typealias ForkFunction = @convention(c) () -> pid_t

    guard let forkFunc = unsafeBitCast(forkPtr, to: ForkFunction?.self) else {
        print("Failed to get fork function")
        exit(1)
    }

    let pid = forkFunc()
    if pid != 0 {
        print("exit parent process for child pid = \(pid)")
        // Parent process or fork failed
        exit(0)
    }

    print("continue as child process pid = \(getpid())")
   
   let app = NSApplication.shared
   let delegate = AppDelegate()
   app.delegate = delegate
   app.setActivationPolicy(.regular)
   app.run()
}

main()
