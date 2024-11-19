String ratingColorGenerator({required double rating}) {
  if (rating <= 100 && rating >= 70) {
    return "good";
  } else if (rating < 70 && rating >= 50) {
    return "average";
  } else {
    return "bad";
  }
}
