mkdir install\include\TH
mkdir install\lib
mkdir install\share\cmake\TH

mkdir torch7\win-build
cd torch7\win-build
cmake -A x64 -DCMAKE_INSTALL_PREFIX=C:\Company\streamlogic\sximage\ext\cpp-torch\install ..\lib\TH
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 TH.vcxproj
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 INSTALL.vcxproj
cd ..\..

mkdir nn\win-build
cd nn\win-build
cmake -A x64 -DCMAKE_INSTALL_PREFIX=C:\Company\streamlogic\sximage\ext\cpp-torch\install ..\lib\THNN
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 THNN.vcxproj
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 INSTALL.vcxproj
cd ..\..

mkdir win-build
cd win-build
cmake -A x64 -DCMAKE_INSTALL_PREFIX=C:\Company\streamlogic\sximage\ext\cpp-torch\install ..
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 cpptorch.vcxproj
msbuild /p:Configuration=Release /p:Platform=x64 /p:PreferredToolArchitecture=x64 INSTALL.vcxproj
cd ..
