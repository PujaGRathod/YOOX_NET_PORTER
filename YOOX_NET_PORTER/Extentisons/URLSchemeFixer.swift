import Foundation

class URLSchemeFixer {

    static func fixMissingScheme(in url: String) -> String {
        var result = url
        if url.hasPrefix("{{scheme}}//") {
            result = url.replacingOccurrences(of: "{{scheme}}", with: "https:")
        }
        if url.contains("{{shot}}_{{size}}"){
            result = result.replacingOccurrences(of: "{{shot}}_{{size}}", with: "in_sl")
        }
        return result
    }
}
