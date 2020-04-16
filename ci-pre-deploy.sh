set -e

echo "Compress results"
tar czvf lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz lang_info_pages/
echo "Compressed results lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz finished"