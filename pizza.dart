import 'dart:io';

void main() {
  bool continueOrdering = true;

  while (continueOrdering) {
    print('========================================================');
    print('Pizza Price: "Small: 5 USD, Medium: 7 USD, Large: 10 USD"');
    print('Please enter your pizza size (small, medium, or large):');
    
    String? size = stdin.readLineSync()?.toLowerCase();

    // Input validation for size
    if (size != 'small' && size != 'medium' && size != 'large') {
      print('Invalid size entered. Please try again.\n');
      continue;
    }

    print('How many pizzas do you want of $size?');
    String? qtyStr = stdin.readLineSync();
    int? quantity = int.tryParse(qtyStr ?? '');

    // Input validation for quantity
    if (quantity == null || quantity <= 0) {
      print('Invalid quantity entered. Please try again.\n');
      continue;
    }

    int price = 0;

    // Switch statement to calculate total
    switch (size) {
      case 'small':
        price = 5;
        break;
      case 'medium':
        price = 7;
        break;
      case 'large':
        price = 10;
        break;
    }

    int totalPayment = price * quantity;
    print('Your Total Payment is: \$$totalPayment');

    // Prompt to continue or exit the while loop
    print('\nWould you like to place another order? (yes/no):');
    String? response = stdin.readLineSync()?.toLowerCase();
    if (response != 'yes' && response != 'y') {
      continueOrdering = false;
    }
  }
}