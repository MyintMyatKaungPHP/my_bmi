String calculateBmiCategory(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return 'Normal weight';
  } else if (bmi >= 25 && bmi < 29.9) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
}

String getSuggestion(String bmiCategory) {
  switch (bmiCategory) {
    case 'Underweight':
      return 'Consider eating more nutritious meals and consult with a healthcare provider.';
    case 'Normal weight':
      return 'Maintain your current lifestyle and keep up the good work!';
    case 'Overweight':
      return 'Consider incorporating more physical activity into your routine and watch your diet.';
    case 'Obesity':
      return 'It is advisable to consult with a healthcare provider for a personalized plan.';
    default:
      return 'Invalid BMI category';
  }
}

Map<String, dynamic> calculateBmiAndSuggest(String gender, double weightKg, double heightCm, int age) {
  double heightM = heightCm / 100;
  double bmi = weightKg / (heightM * heightM);
  String bmiCategory = calculateBmiCategory(bmi);
  String suggestion = getSuggestion(bmiCategory);

  return {
    'bmi': bmi,
    'bmiCategory': bmiCategory,
    'suggestion': suggestion,
  };
}
