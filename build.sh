wget https://github.com/DevAdalat/tdlibjson-prebuilt/releases/download/tdlibjson/jniLibs.tar.gz -O android/app/src/main/jniLibs.tar.gz
tar -xf android/app/src/main/jniLibs.tar.gz -C android/app/src/main/
rm -rf android/app/src/main/jniLibs.tar.gz
flutter build apk --split-per-abi
