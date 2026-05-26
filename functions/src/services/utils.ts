/**
 * Remove all occurrences of "Cloud" and all whitespaces from a given string.
 * @param {string} str - The input string.
 * @return {string} - The input string with all occurrences of "Cloud" and
 * all whitespaces removed.
 * @example
 * // returns "HelloWorld"
 * removeCloudAndWhitespace("Hello Cloud World");
 */
export function removeCloudAndWhitespace(str: string): string {
  const regex = /Cloud/g;
  const newStr = str.replace(regex, "").replace(/\s+/g, "");
  return newStr;
}

/**
 * Removes any leading numbers and spaces from each string in an array.
 *
 * @function removeLeadingNumbers
 * @param {string[]} arr The input array of strings.
 * @return {string[]} An array of strings with leading numbers removed.
 */
export function removeLeadingNumbers(arr: string[]): string[] {
  const output: string[] = [];
  for (let i = 0; i < arr.length; i++) {
    const regex = /^\d+\s*/; // Matches any leading digits and spaces
    // Removes any leading digits and spaces
    output.push(arr[i].replace(regex, ""));
  }
  return output;
}
