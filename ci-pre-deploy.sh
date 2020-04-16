set -e

echo "Compress results"
tar -czvf lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz lang_info_pages/

echo "lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz"

if [ -e ./lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz ]; then
  echo "Compressed results lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz finished"
else
  echo "Failed to compress results"
fi