# SwinjectMVVMExample_ForBlog

This is an example project to demonstrate [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) and [Swinject](https://github.com/Swinject/Swinject) in [MVVM (Model-View-ViewModel)](https://en.wikipedia.org/wiki/Model_View_ViewModel) architecture with [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa). This project is a simplified version of [Swinject/SwinjectMVVMExample](https://github.com/Swinject/SwinjectMVVMExample) to exactly follow [my blog posts](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-1-introduction/) (except updates of Xcode and frameworks).

![Screenshot](https://yoichitgy.github.io/images/post/2015-09/SwinjectMVVMExampleCellsWithImagesScreenshot.png)

## Requirements

- Xcode 7.1
- [Carthage](https://github.com/Carthage/Carthage) 0.10.0 or later
- [Pixabay](https://pixabay.com/api/docs/) API username and key

## Setup

1. Download the source code or clone the repository.
2. Run `carthage bootstrap --no-use-binaries --platform iOS`.
3. Get a free API username and key from [Pixabay](https://pixabay.com/). They are displayed in [the API documentation page](https://pixabay.com/api/docs/) after you log in there.
4. Create a text file named `Pixabay.Config.swift` with the following content in `ExampleModel` folder in the project. The strings `"YOUR_USERNAME"` and `"YOUR_API_KEY"` should be replaced with your own username and key.

**Pixabay.Config.swift**

    extension Pixabay {
        internal struct Config {
            internal static let apiUsername = "YOUR_USERNAME"
            internal static let apiKey = "YOUR_API_KEY"
        }
    }

## Blog Posts

The following blog posts demonstrate step-by-step development of the project.

- [Dependency Injection in MVVM Architecture with ReactiveCocoa Part 1: Introduction](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-1-introduction/)
- [Dependency Injection in MVVM Architecture with ReactiveCocoa Part 2: Project Setup](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-2-project-setup/)
- [Dependency Injection in MVVM Architecture with ReactiveCocoa Part 3: Designing the Model](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-3-designing-the-model/)
- [Dependency Injection in MVVM Architecture with ReactiveCocoa Part 4: Implementing the View and ViewModel](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-4-implementing-the-view-and-viewmodel/)
- [Dependency Injection in MVVM Architecture with ReactiveCocoa Part 5: Asynchronous Image Load](https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-5-asynchronous-image-load/)

## License

MIT license. See the [LICENSE file](LICENSE.txt) for details.
