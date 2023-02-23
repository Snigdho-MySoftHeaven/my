List<String> keyList = [];
void liststring(String s) {
  keyList = [];
  s.split('</h2>').forEach((element) {
    if (element.contains('<h2>')) {
      keyList.add(element);
    } else {
      element.split('<p>').forEach((element) {
        if (element.contains('</p>')) {
          keyList.add(element);
        } else {
          element.split('<br>').forEach((element) {
            if (element.contains('</br>')) {
              keyList.add(element);
            } else {
              element.split('<h3>').forEach((element) {
                if (element.contains('</h3>')) {
                  keyList.add(element);
                } else {}
              });
            }
          });
        }
      });
    }
  });
}
