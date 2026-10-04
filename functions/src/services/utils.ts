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
 * Converts report/UI field names to Firestore service field names.
 *
 * @param {string | undefined} field - The reported field name.
 * @return {string | null} The canonical service field name.
 */
export function canonicalServiceField(
  field: string | undefined,
): string | null {
  switch ((field || "").trim()) {
  case "description":
  case "detail":
  case "example":
  case "benefits":
  case "cons":
    return field || null;
  case "use_cases":
  case "usecases":
  case "useCases":
    return "useCases";
  default:
    return null;
  }
}

/**
 * Removes common list prefixes and markdown wrappers from generated text.
 *
 * @param {string} value - Generated text to normalize.
 * @return {string} Display-friendly text.
 */
export function normalizeTextContent(value: string): string {
  return value
    .replace(/```[a-zA-Z]*\n?/g, "")
    .replace(/```/g, "")
    .split("\n")
    .map((line) => line.replace(/^\s*(?:[-*•]|\d+[.)])\s+/, "").trim())
    .filter((line) => line.length > 0)
    .join("\n")
    .trim();
}

/**
 * Removes list numbering/bullets so Flutter list widgets own numbering.
 *
 * @param {string[]} arr - List items to normalize.
 * @return {string[]} Display-friendly list items.
 */
export function normalizeListContent(arr: string[]): string[] {
  return arr
    .map((item) => normalizeTextContent(item)
      .replace(/\n+/g, " ")
      .replace(/\s+/g, " ")
      .trim())
    .filter((item) => item.length > 0);
}

/**
 * Removes any leading numbers and spaces from each string in an array.
 *
 * @function removeLeadingNumbers
 * @param {string[]} arr The input array of strings.
 * @return {string[]} An array of strings with leading numbers removed.
 */
export function removeLeadingNumbers(arr: string[]): string[] {
  return normalizeListContent(arr);
}
