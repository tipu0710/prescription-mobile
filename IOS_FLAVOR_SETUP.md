# iOS Flavor Setup Guide

Use this guide to configure the `dev` and `prod` flavors in Xcode so you can run `flutter run --flavor dev`.

## 1. Open Project in Xcode
1. Can also run `open mobile/ios/Runner.xcworkspace` in your terminal.
2. Or open Xcode, click **File > Open**, and select `mobile/ios/Runner.xcworkspace`.

## 2. Create Build Configurations
You need to duplicate the existing `Debug`, `Release`, and `Profile` configurations for each flavor.

1. In the left project navigator (folder icon), click on the top-level **Runner** (blue icon).
2. In the main view, select the **Runner** project (under "PROJECT", not "TARGETS").
3. Select the **Info** tab.
4. Locate the **Configurations** section.
5. **Create `dev` configurations:**
   - Click the **+** (plus) icon > **Duplicate "Debug" Configuration**. Name it **`Debug-dev`**.
   - Click the **+** icon > **Duplicate "Release" Configuration**. Name it **`Release-dev`**.
   - Click the **+** icon > **Duplicate "Profile" Configuration**. Name it **`Profile-dev`**.
6. **Create `prod` configurations:**
   - Click the **+** icon > **Duplicate "Debug" Configuration**. Name it **`Debug-prod`**.
   - Click the **+** icon > **Duplicate "Release" Configuration**. Name it **`Release-prod`**.
   - Click the **+** icon > **Duplicate "Profile" Configuration**. Name it **`Profile-prod`**.

## 3. Create Schemes
Schemes tell Xcode which configuration to use when you click "Run".

1. In the top menu bar, click **Product > Scheme > Manage Schemes...**.
2. **Create `dev` scheme:**
   - Click the **+** button at the bottom left.
   - **Target:** Ensure `Runner` is selected.
   - **Name:** Type `dev`.
   - Click **OK**.
3. **Configure `dev` scheme:**
   - With `dev` selected, click **Edit...** (bottom).
   - **Run (Debug):** Change "Build Configuration" to **`Debug-dev`**.
   - **Test:** Change "Build Configuration" to **`Debug-dev`**.
   - **Profile:** Change "Build Configuration" to **`Profile-dev`**.
   - **Analyze:** Change "Build Configuration" to **`Debug-dev`**.
   - **Archive (Release):** Change "Build Configuration" to **`Release-dev`**.
   - Click **Close**.
4. **Create `prod` scheme:**
   - Click **+**. Name it `prod`. Target: `Runner`.
   - Click **Edit...**.
   - **Run:** Set to **`Debug-prod`**.
   - **Archive:** Set to **`Release-prod`**.
   - (Update Test/Profile/Analyze matching the pattern if you wish, though Run/Archive are most critical).
   - Click **Close**.

## 4. Verify Bundle Identifiers (Optional but Recommended)
To have separate apps installed on your phone (e.g., "App Dev" vs "App"):

1. Select **Runner** target (under "TARGETS").
2. Select **Build Settings** tab.
3. Search for `Product Bundle Identifier`.
4. Expand the row. You will see your new configurations (`Debug-dev`, `Release-dev`, etc.).
5. Change the values:
   - For `*-dev`: `com.babosthapotro.app.dev`
   - For `*-prod`: `com.babosthapotro.app`

## 5. Verify Display Name (Optional)
To change the app name on the home screen based on the flavor (e.g. "My App Dev"):

1.  Select **Runner** target (under "TARGETS") in the left sidebar.
2.  Select the **Build Settings** tab.
3.  Click the **+** (plus) button at the very top left of the Build Settings table (next to the search bar) and choose **Add User-Defined Setting**.
4.  Name the new setting `APP_DISPLAY_NAME`.
5.  Expand the arrow next to `APP_DISPLAY_NAME` to see your configurations.
6.  Set the values:
    -   `Debug-dev` / `Release-dev`: **Babosthapotro Dev**
    -   `Debug-prod` / `Release-prod`: **Babosthapotro**
7.  Open `Info.plist` (in the project navigator on the left).
8.  Find **Bundle display name** (or `CFBundleDisplayName`).
9.  Change its value to `$(APP_DISPLAY_NAME)`.

## 6. Run
Back in your terminal (or VS Code):
```bash
flutter run --flavor dev -t lib/main_dev.dart
```
