/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct VolumeInfo : Codable {
	let title : String?
	let authors : [String]?
	let publisher : String?
	let publishedDate : String?
	let description : String?
	let industryIdentifiers : [IndustryIdentifiers]?
	let readingModes : ReadingModes?
	let pageCount : Int?
	let printType : String?
	let categories : [String]?
	let averageRating : Double?
	let ratingsCount : Int?
	let maturityRating : String?
	let allowAnonLogging : Bool?
	let contentVersion : String?
	let imageLinks : ImageLinks?
	let language : String?
	let previewLink : String?
	let infoLink : String?
	let canonicalVolumeLink : String?

	enum CodingKeys: String, CodingKey {

		case title = "title"
		case authors = "authors"
		case publisher = "publisher"
		case publishedDate = "publishedDate"
		case description = "description"
		case industryIdentifiers = "industryIdentifiers"
		case readingModes = "readingModes"
		case pageCount = "pageCount"
		case printType = "printType"
		case categories = "categories"
		case averageRating = "averageRating"
		case ratingsCount = "ratingsCount"
		case maturityRating = "maturityRating"
		case allowAnonLogging = "allowAnonLogging"
		case contentVersion = "contentVersion"
		case imageLinks = "imageLinks"
		case language = "language"
		case previewLink = "previewLink"
		case infoLink = "infoLink"
		case canonicalVolumeLink = "canonicalVolumeLink"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		authors = try values.decodeIfPresent([String].self, forKey: .authors)
		publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
		publishedDate = try values.decodeIfPresent(String.self, forKey: .publishedDate)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		industryIdentifiers = try values.decodeIfPresent([IndustryIdentifiers].self, forKey: .industryIdentifiers)
		readingModes = try values.decodeIfPresent(ReadingModes.self, forKey: .readingModes)
		pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
		printType = try values.decodeIfPresent(String.self, forKey: .printType)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		averageRating = try values.decodeIfPresent(Double.self, forKey: .averageRating)
		ratingsCount = try values.decodeIfPresent(Int.self, forKey: .ratingsCount)
		maturityRating = try values.decodeIfPresent(String.self, forKey: .maturityRating)
		allowAnonLogging = try values.decodeIfPresent(Bool.self, forKey: .allowAnonLogging)
		contentVersion = try values.decodeIfPresent(String.self, forKey: .contentVersion)
		imageLinks = try values.decodeIfPresent(ImageLinks.self, forKey: .imageLinks)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		previewLink = try values.decodeIfPresent(String.self, forKey: .previewLink)
		infoLink = try values.decodeIfPresent(String.self, forKey: .infoLink)
		canonicalVolumeLink = try values.decodeIfPresent(String.self, forKey: .canonicalVolumeLink)
	}

}