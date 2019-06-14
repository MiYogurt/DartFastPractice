@JS()
library sizzle;

import "package:js/js.dart";
import "dart:html" show Element, Document, DocumentFragment;

/// Type definitions for sizzle 2.3
/// Project: https://sizzlejs.com
/// Definitions by: Leonard Thieu <https://github.com/leonard-thieu>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped
/// TypeScript Version: 2.3
@JS()
external SizzleStatic
    get Sizzle; /* WARNING: export assignment not yet supported. */

@anonymous
@JS()
abstract class SizzleStatic {
  external Selectors get selectors;
  external set selectors(Selectors v);
  /*external TArrayLike call(String selector, Element|Document|DocumentFragment context, TArrayLike results);*/
  /*external List<Element> call(String selector, [Element|Document|DocumentFragment context]);*/
  external dynamic /*TArrayLike|List<Element>*/ call(String selector,
      [dynamic /*Element|Document|DocumentFragment*/ context,
      dynamic/*=TArrayLike*/ results]);

  /// tslint:disable-next-line:ban-types
  external Function compile(String selector);
  external bool matchSelector(Element element, String selector);
  external List<Element> matches(String selector, List<Element> elements);
}

// Module Sizzle
@anonymous
@JS()
abstract class Selectors {
  external num get cacheLength;
  external set cacheLength(num v);
  external Matches get match;
  external set match(Matches v);
  external FindFunctions get find;
  external set find(FindFunctions v);
  external PreFilterFunctions get preFilter;
  external set preFilter(PreFilterFunctions v);
  external FilterFunctions get filter;
  external set filter(FilterFunctions v);
  external AttrHandleFunctions get attrHandle;
  external set attrHandle(AttrHandleFunctions v);
  external PseudoFunctions get pseudos;
  external set pseudos(PseudoFunctions v);
  external SetFilterFunctions get setFilters;
  external set setFilters(SetFilterFunctions v);
  external PseudoFunction createPseudo(CreatePseudoFunction fn);
}

// Module Selectors
@anonymous
@JS()
abstract class Matches {
  /* Index signature is not yet supported by JavaScript interop. */
}

@anonymous
@JS()
abstract class RegExpMatchArray extends List<String>{
  num index;
  String input;
  external factory RegExpMatchArray();
}

typedef dynamic /*List<Element>|Null*/ FindFunction(
    RegExpMatchArray match, dynamic /*Element|Document*/ context, bool isXML);

@anonymous
@JS()
abstract class FindFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef List<String> PreFilterFunction(RegExpMatchArray match);

@anonymous
@JS()
abstract class PreFilterFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef bool FilterFunction(String element,
    [String matches1,
    String matches2,
    String matches3,
    String matches4,
    String matches5]);

@anonymous
@JS()
abstract class FilterFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef String AttrHandleFunction(
    dynamic elem, String casePreservedName, bool isXML);

@anonymous
@JS()
abstract class AttrHandleFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef bool PseudoFunction(Element elem);

@anonymous
@JS()
abstract class PseudoFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef List<Element> SetFilterFunction(
    List<Element> elements, num argument, bool not);

@anonymous
@JS()
abstract class SetFilterFunctions {
  /* Index signature is not yet supported by JavaScript interop. */
}

typedef PseudoFunction CreatePseudoFunction(
    [dynamic args1,
    dynamic args2,
    dynamic args3,
    dynamic args4,
    dynamic args5]);
// End module Selectors

// End module Sizzle

