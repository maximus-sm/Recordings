2,055 / 5,000
# Recordings
This project is based on the example project from the book `App Architecture iOS Application Design Patterns in Swift by Chris Eidhof, Matt Gallagher, and Florian Kugler`
- <img src="https://github.com/maximus-sm/Recordings/blob/main/example.gif" width="25%" height="25%"/>
## Goal
Transfer project from UIKit to SwiftUI framework.

## Challanges
- Understand how the original project parts interats with each other. Even though the project is relatively small , but the modules relathionps a little bit tricky for newbies.Especially when you stumble upon parts with Reactive programming.
- When and how to use `@State`, `@Environment` , `@Observalble` and other SwiftUI property attributes. They are essenital to understand the framework itself.
- What is `@ViewBuilder` and how it forms your Views into a tree.

## [Original Project](https://github.com/objcio/app-architecture?tab=readme-ov-file) insights
- `FileManager` is used to save and load `Folder`s and `Recordings`s.
- `NotificationCenter` to update the View's only after the operation over data succeeds.
- The MVVM-C version uses RxSwift and the View's updated after republishing 'Folder' or 'Recodring' object after CRUD operation.<br/>
`//Every time the folder changes`<br/>
`  .flatMapLatest { currentFolder in`<br/>
`  // Start by emitting the initial value`<br/>
`  Observable.just(currentFolder)`<br/>
`   // Re-emit the folder every time a non-delete change occurs `<br/>
`  .concat((currentFolder?.changeObservable.map { _ in currentFolder })!)`<br/>
`   // Stop when a delete occurs`<br/>
`  .takeUntil(currentFolder!.deletedObservable)`<br/>
`  // After a delete, set the current folder back to nil`<br/>
`  .concat(Observable.just(nil))`<br/>
`}.share(replay: 1)`<br/>
## Key differences
- There are no View Contollers. The view state is managed by `@State` and other property attributes.
- `Observable` macro used to keep track changes of the DB.
- No Coordiantor

## ToDo
- [x] Make working app with SwiftUI
- [ ] Write SwiftUI tests
- [ ] Add support for earlier iOS versions with use of Combine.(It is not hard just copy and paste with #if available, but how to find more consiece way)
      
## Reference
- [Thinking in SwiftUI](https://www.objc.io/books/thinking-in-swiftui/) by Chris Eidhof and Florian Kugler
- [App Architecture iOS Application Design Patterns in Swift](https://www.objc.io/books/app-architecture/)
- [RxSwift: Reactive Programming with Swift](https://www.kodeco.com/books/rxswift-reactive-programming-with-swift)
- [Combine: Asynchronous Programming With Swift](https://www.kodeco.com/books/combine-asynchronous-programming-with-swift/v4.0)
