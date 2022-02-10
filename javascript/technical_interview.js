/*
Optimise the function 'take'
    - kvArr and keys may be thousand of elements long
    - for simplicity, kvArr has unique keys
    - an example has been provided below the definition
*/

function take(kvArr, keys) {
  return keys.map((key) => {
    const item = kvArr.filter((kv) => kv[0] === key)[0];

    if (item) {
      return item[1];
    } else {
      return undefined;
    }
  });
}


// Example
exampleKVArr = [[1, 'A'], [2, 'B'], [4, 'D'] ];
exampleKeys = [1, 2, 3];

const example = take(exampleKVArr, exampleKeys); 
console.dir(example); // => ['A', 'B', undefined]