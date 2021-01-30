# DynamicWeatherEffects
This Is The Plugin Source Code Repo For What Will Be The FrameWork For The Dynamic Weather Effects Mod I'm Working On. I Hope To Extend This Much Further Beyond That Project In The Future, But First Thing's First, Get This Up And Running For That Mod!

### Building ###
To Build, You'll First Need:
- CommonLibSSE's Dependencies
    - span-lite
    - spdlog 
</br>

Optional Dependencies:
- For Static Analysis Checks (You'll Need To Set The Env Path If You Use These):
    - cppcheck
    - clang-tidy
    - include-what-you-use
    - ccache
- For Tests:
    - catch2

- Generating Project Files
    - Run  ```"git clone https://github.com/USAFrenzy/DynamicWeatherEffects-Framework.git"```
    - Run  ```"git submodule update --init --recursive"```
    - Run  ```"git submodule update --recursive --remote"```
    - Run  ```"cmake -B build[Or Other Output Destination] -S ."```
- Building DLL
    - Open Your IDE Of Choice Used To Generate The Project Files
    - Click On The ```Solution``` Tab And Hit ```Build```
    - Or Just Build Individually By Clicking On ```CommonLibSSE``` And ```Build``` And Then Clicking On ```DynamicWeatherEffects``` And ```Build```
        - Building ```DynamicWeatherEffects``` Should Build ```CommonLibSSE``` Anyways As It Relies On That Library

Done! That's All You Need To Do!

#### ********** Special Thanks And Credits ********** #### 
Ryan-rsm-McKenzie - CommonLibSSE<br/>
gabime - spdlog<br/>
martinmoene - span-lite<br/>
