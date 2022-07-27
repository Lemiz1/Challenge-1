actor{
    import Array "mo:base/Array";

    //Challenge 1
    public func addTwoFactors(n : Nat, m : Nat) : async Nat {
    return(m+n);
    };

    //Challenge 2
    public func squareFunc(length : Nat) : async Nat{
    return(length**length);
    }
    
    
    //challenge 3
    public func days_to_second(n : Nat) : async Nat{
    return(n*86400);
    }
    
    var counter = 0;
    //Challenge 4
    public func increment_counter(n : Nat) : async Nat{
    counter += n;
    return(counter);
    };


    //Challenge 5
    public func clear_counter() : async Nat{
    counter := 0;
    return(counter);
    }

    public func divide(n : Nat, m: Nat) : async Bool{
    return(n%m ==0);
    }

    //Challenge 6
    public func is_even(n : Nat) : async Bool{
    if (n == 0){
        return(false);
    }
    else{
        return(n%2 == 0);
    }
    }

    //Challenge 7
    var storeNumber : Nat = 0;
    public func addSum(aRray : [Nat]) : async Nat{
    for (value in aRray.vals()){
        storeNumber += value;
    };
    return storeNumber;
    }

    //Challenge 8
    var maxValue : Nat = 0;
    public func returnMax(firstArray : [Nat]) : async Nat{
    for (value in firstArray.vals()){
        if (value > maxValue) {
        maxValue := value;
        }
    };
    return maxValue
    }

    //Challenge 9
    public func remove_from_array(array : [Nat], chosen : Nat) : async [Nat] {
    var answerArray : [Nat] = [];
    for (value in array.vals()) {
        if (value != chosen) {
            answerArray := Array.append<Nat>(answerArray, [value]);
        }
    }; 
    return(answerArray);
    }   


    //Challenge 10
    private func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
        //transform our immutable array into a mutable one so we can modify
        let array_mutable = Array.thaw<Nat>(array);
        let tmp = array[i];
        array_mutable[i] := array[j];
        array_mutable[j] := tmp;
        //Transform our mutable array into an imutable array    
        return(Array.freeze<Nat>(array_mutable));
    };
    
    public func returnArray(numArr : [Nat]) : async [Nat] {
        var sorted = numArr;
        var size = numArr.size();
        var i = 0;
        while (i < size-1) {
            var j = i + 1;
            var min_index = i;
            while (j < size){
              if(sorted[j] < sorted[min_index]){
                min_index := j;
              };
              j := j + 1;
            };
            sorted := swap(sorted, min_index, i);
            i := i + 1;
        };
        return(sorted);
    }
}
