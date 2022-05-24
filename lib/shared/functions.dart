void addDetails(
    Map<String, dynamic> map, String propertyName, dynamic propertyValue) {
  if (map.containsKey(propertyName)) {
    map.update(propertyName, (val) => propertyValue);
  } else {
    map.addAll({propertyName: propertyValue});
  }
}