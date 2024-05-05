**Data flow in SwiftUI**
﻿

We will discuss property wrappers provided by SwiftUI to how data moves & updates the view.

_﻿linkedin: https://www.linkedin.com/in/nikdange﻿
instagram: https://www.instagram.com/journey_ios﻿_


![Reference](https://github.com/nikhildange/swift_talk_data_flow/blob/main/cf49d8a3-9436-4768-a553-229a452d957e.webp)


Property Wrapper provided by SwiftUI

@State
@Binding
@ObservedObject
@StateObject
@EnvironmentObject
@FetchRequest
@Query
@Namespace
@Bindable
@AppStorage
@SceneStorage
@FocusedBinding
@FocusedValue
@GestureState
@NSApplicationDelegateAdaptor
@Environment
@ScaledMetric


-->
Why Property Wrapper?
﻿
Anything that starts with @ in swift is property wrapper
﻿
Swift feature [5.1] that

add functionality to your properties.
encapsulating common behaviour within properties. 
﻿
● Benefit:

No redundant code 

-->
View?

View in swiftUI are “struct", value type.
They are very cheap to create & destroy.
Remember, struct are immutable.


-->
What all in PPT?

SwiftUI heavily uses property wrappers

﻿@State
view's mutable state

@Binding
Pass mutable state

@Environment

ObservableObject
Protocol to observed by views

@StateObject
Observable object instance of view

@ObservedObject

@EnvronmentObject
Share data across app

@Published
Publish changes to properties

-->
 @State?
To store and manage simple data within a view struct, 

What it does?
Make property mutable
Automatically trigger view rendering to reflect the new state.
Value persist after view refresh
Suited for value type

When?
Ideal for View update is triggered by changes in data within a single view.


-->
 @Binding
Used to pass mutable state between views.

What it does?
Binds with external property
Two-way binding between a property in a child view and its parent view.
“$” used to access binding property.

When?
Ideal for creating bi-directional communication between views.


-->
 Observable Object
‘ObservableObject’ is a protocol provided by SwiftUI

What it does?
Defines an object whose changes can be observed by SwiftUI views
Enables reactive UI updates based on changes in the underlying data model.

When?
Ideal for 
managing state
encapsulating logic
representing data models

@Published 
Used within an ObservableObject to publish changes to its properties.


-->
 @StateObject
It is used for creating and managing objects within a specific view.

What it does?
View observes & updates component
The object is automatically retained and initialized only once during the view's lifecycle.

When?
Ideal for 
managing the state of the view
encapsulating complex logic 

VM is related / specific to single view

When Not to Use @StateObject?
Avoid using @StateObject for managing shared state across multiple views.


-->
 @ObservedObject
Allow to pass observable object between view

What?
Used for external objects that conform to ObservableObject
Usually passed down from parent to child
Value is not persist after whole view refresh

When?
Child View need access to source of truth / StateObject of Parent View


-->
 @EnvironmentObject
EnvironmentObject is used for sharing objects across multiple views in the hierarchy.

What ?
Ideally it’s for app-wide ObservableObject, so initialised in root of the App

How ? 
Inject an object into a SwiftUI view's environment, access to views
Passed down by View().environmentObject(object)
