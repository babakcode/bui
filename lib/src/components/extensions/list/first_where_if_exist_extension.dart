extension FirstWhereIfExistExtension<E> on List<E>{

  E? firstWhereIfExist(bool Function(E element) test, {E Function()? orElse}){
    if(orElse != null){
      try{

        return firstWhere(test, orElse: orElse);
      }catch(e){
        throw Exception('No Element!');
      }
    }

    if(any(test)){
      return firstWhere(test, orElse: orElse);
    }

    return null;
  }

}