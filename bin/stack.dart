class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _items.removeLast();
  }

  bool get isEmpty => _items.isEmpty;
}

void main(List<String> arguments) {
  Challenge1();
  Challenge2();
}

void printListInReverse(List<dynamic> myList) {
  Stack<dynamic> stack = Stack<dynamic>();

  // Push elements onto the stack
  for (var item in myList) {
    stack.push(item);
  }

  // Pop and print elements from the stack
  while (!stack.isEmpty) {
    print(stack.pop());
  }
}

void Challenge1() {
  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> words = ['apple', 'banana', 'cherry', 'date'];

  print('Numbers in reverse order:');
  printListInReverse(numbers);

  print('\nWords in reverse order:');
  printListInReverse(words);
}

bool areParenthesesBalanced(String input) {
  Stack<String> stack = Stack<String>();

  for (int i = 0; i < input.length; i++) {
    String currentinput = input[i];

    if (currentinput == '(') {
      stack.push(currentinput);
    } else if (currentinput == ')') {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }
  return stack.isEmpty;
}

void Challenge2() {
  String balancedExpression = '(a + b) * (c - d)';
  String unbalancedExpression = 'a + b) * (c - d';

  print('Is the parentheses balanced in "$balancedExpression"?');
  print(areParenthesesBalanced(balancedExpression) ? 'true' : 'false');

  print('\nIs the parentheses balanced in "$unbalancedExpression"?');
  print(areParenthesesBalanced(unbalancedExpression) ? 'true' : 'fasle');
}
