class Calculator {
  final _operands = <double>[];
  final _operations = <Operations>[];

  double get popOperand {
    var res = _operands.last;
    _operands.remove(res);
    return res;
  }

  Operations get popOperation {
    var res = _operations.last;
    _operations.remove(res);
    return res;
  }

  void _calculate() {
    if (_operations.last == Operations.openBrackets) {
      return;
    }

    double operand2 = popOperand;

    pushOperand(Operation.calculate(popOperation, popOperand, operand2));
  }

  void pushOperand(double operand) {
    _operands.add(operand);
  }

  void pushOperation(Operations operation) {
    if (operation == Operations.closeBrackets) {
      while (_operations.last != Operations.openBrackets) {
        _calculate();
      }

      // remove "(" - Operations.openBrackets
      popOperation;
      return;
    } else if (_operations.isEmpty || operation == Operations.openBrackets) {
      _operations.add(operation);
      return;
    } else if (Operation.operationsPriorities[operation]! <=
        Operation.operationsPriorities[_operations.last]!) {
      _calculate();
    }

    _operations.add(operation);
  }

  double get Answer
  {
    while (_operations.isNotEmpty)
    {
      _calculate();
    }

    return _operands.last;
  }

  void clear()
  {
    while (_operations.isNotEmpty)
    {
      popOperation;
    }

    while (_operands.isNotEmpty)
    {
      popOperand;
    }
  } 
}

enum Operations {
  addition,
  subtraction,
  multiplication,
  division,
  openBrackets,
  closeBrackets
}

class Operation {
  static const operationsPriorities = {
    Operations.openBrackets: 0,
    Operations.closeBrackets: 0,
    Operations.addition: 1,
    Operations.subtraction: 1,
    Operations.multiplication: 2,
    Operations.division: 2
  };

  static double calculate(
      Operations operation, double operand1, double operand2) {
    switch (operation) {
      case Operations.addition:
        return operand1 + operand2;
      case Operations.subtraction:
        return operand1 - operand2;
      case Operations.multiplication:
        return operand1 * operand2;
      case Operations.division:
        return operand1 / operand2;
      case Operations.openBrackets:
        return 0;
      case Operations.closeBrackets:
        return 0;
    }
  }
}
