## [0.0.9-dev.9] - January 16, 2022.

- Shared utilities for personal Flutter projects
- Updated use cases result
- added `doAfterDelay` functions (serves as a workaround for calling `setState` in the `initState` of
  a `StatefulWidget`)
- updated status bar color for IOS devices

## Note

You must call `initializeSharedUtils(context)` in your initial route/widget to setup this library
