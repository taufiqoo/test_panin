const digitsDown = (num) => {
  const numAsString = num.toString().replace(/\./g, "");
  const digits = numAsString.split("").map(Number);

  digits.forEach((digit, index) => {
    const result = digit * Math.pow(10, digits.length - index - 1);
    console.log(result);
  });
};

console.log("Output untuk angka 1.225.441:");
digitsDown(1225441);

console.log("Output untuk angka 3.579:");
digitsDown(3.579);
