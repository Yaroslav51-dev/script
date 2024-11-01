
repo init --depth=1 --no-repo-verify -u https://github.com/AOSPA/manifest -b uvite -g default,-mips,-darwin,-notdefault
git clone https://github.com/Yaroslav51-dev/local_manifests_liuqin -b aospa .repo/local_manifests

if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
fi

source build/envsetup.sh
./rom-build.sh liuqin
