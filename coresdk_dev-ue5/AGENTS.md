# CoreSDK

  ## Purpose
  This folder contains source code and assets that implement a central shared set of Unreal Engine extensions called CoreSDK (also known as the shared Riot Unreal Ecosystem). Multiple Unreal Engine games integrate versions of this central SDK.

  ## Project Structure & Module Organization
  - CoreSDK/ contains the shared SDK code and content, the UE plugins are critical components of the shared ecosystem in CoreSDK/Plugins
  - Engine/ contains the Unreal Engine. The shared SDK sits on top Unreal Engine and we distribute that too with CoreSDK versions. We have some modifications to it to fit our needs.

  ## Unreal Engine
  - CoreSDK currently is based on Unreal Engine 5.7
  