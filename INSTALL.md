
Install Visual Studio 2019.
Install libxml2 from `https://www.zlatkovic.com/pub/libxml/libxml2-2.7.8.win32.zip` to `C:\Program Files\libxml2`.
Install eigen2 from `http://bitbucket.org/eigen/eigen/get/3.3.7.zip` to `C:\Program Files\Eigen3`.

Create directory structure like this:

```
C:\openbabel\src
     \x64

c:\openbabel\bin
      \x64

c:\openbabel\build
     \x64
```

From within the mzAnnotation project directory:

```
mkdir openbabel

cd openbabel

"C:\Program Files\Git\mingw64\bin\curl.exe" -o openbabel.zip -L "https://github.com/openbabel/openbabel/archive/openbabel-3-0-0.zip"

unzip openbabel.zip 

xcopy /s openbabel-openbabel-3-0-0\* C:\openbabel\src\x64

cd C:\openbabel\build\x64

"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe" -DCMAKE_INSTALL_PREFIX=C:/openbabel/bin/x64 -DLIBXML2_INCLUDE_DIR=C:/Program\ Files/libxml2/include -DLIBXML2_LIBRARIES=C:/Program\ Files/libxml2/lib C:\openbabel\src\x64
```

Open `openbabel.sln` in Visual Studio 2019.
At the top of the window just below the menu bar, choose Release in the drop-down box.
On the right-hand side, right-click on the ALL_BUILD target, and choose Build.

Navigate to `openbabel` directory within mzAnnotation directory.

```
xcopy C:\openbabel\build\x64\include\openbabel\babelconfig.h c:\openbabel\src\x64\include\openbabel
```


Add the following environment variables:

```
OPEN_BABEL_SRC = c:/openbabel/src

OPEN_BABEL_BIN = c:/openbabel/build
```

