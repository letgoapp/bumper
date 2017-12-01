//
//  BumperFeatures.swift
//  Letgo
//
//  GENERATED - DO NOT MODIFY - use flags_generator instead.
// 
//  Copyright © 2016 Letgo. All rights reserved.
//

import Foundation
import bumper
#if (RX_BUMPER)
import RxSwift
#endif

extension Bumper  {
    static func initialize() {
        var flags = [BumperFeature.Type]()
        flags.append(NameOfFirstFeature.self)
        flags.append(NameOfSecondFeature.self)
        flags.append(NameOfThirdFeature.self)
        Bumper.initialize(flags)
    } 

    static var nameOfFirstFeature: NameOfFirstFeature {
        guard let value = Bumper.value(for: NameOfFirstFeature.key) else { return .firstValue }
        return NameOfFirstFeature(rawValue: value) ?? .firstValue 
    } 

    #if (RX_BUMPER)
    static var nameOfFirstFeatureObservable: Observable<NameOfFirstFeature> {
        return Bumper.observeValue(for: NameOfFirstFeature.key).map {
            NameOfFirstFeature(rawValue: $0 ?? "") ?? .firstValue
        }
    }
    #endif

    static var nameOfSecondFeature: Bool {
        guard let value = Bumper.value(for: NameOfSecondFeature.key) else { return true }
        return NameOfSecondFeature(rawValue: value)?.asBool ?? true
    } 

    #if (RX_BUMPER)
    static var nameOfSecondFeatureObservable: Observable<Bool> {
        return Bumper.observeValue(for: NameOfSecondFeature.key).map {
            NameOfSecondFeature(rawValue: $0 ?? "")?.asBool ?? true
        }
    }
    #endif

    static var nameOfThirdFeature: Bool {
        guard let value = Bumper.value(for: NameOfThirdFeature.key) else { return false }
        return NameOfThirdFeature(rawValue: value)?.asBool ?? false
    } 

    #if (RX_BUMPER)
    static var nameOfThirdFeatureObservable: Observable<Bool> {
        return Bumper.observeValue(for: NameOfThirdFeature.key).map {
            NameOfThirdFeature(rawValue: $0 ?? "")?.asBool ?? false
        }
    }
    #endif
}


enum NameOfFirstFeature: String, BumperFeature  {
    case firstValue, secondValue, thirdValue
    static var defaultValue: String { return NameOfFirstFeature.firstValue.rawValue }
    static var enumValues: [NameOfFirstFeature] { return [.firstValue, .secondValue, .thirdValue]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "First test description" } 
    static func fromPosition(_ position: Int) -> NameOfFirstFeature {
        switch position { 
            case 0: return .firstValue
            case 1: return .secondValue
            case 2: return .thirdValue
            default: return .firstValue
        }
    }
}

enum NameOfSecondFeature: String, BumperFeature  {
    case yes, no
    static var defaultValue: String { return NameOfSecondFeature.yes.rawValue }
    static var enumValues: [NameOfSecondFeature] { return [.yes, .no]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test very long description Boolean test very long description Boolean test very long description Boolean test very long description" } 
    var asBool: Bool { return self == .yes }
}

enum NameOfThirdFeature: String, BumperFeature  {
    case no, yes
    static var defaultValue: String { return NameOfThirdFeature.no.rawValue }
    static var enumValues: [NameOfThirdFeature] { return [.no, .yes]}
    static var values: [String] { return enumValues.map{$0.rawValue} }
    static var description: String { return "Boolean test description" } 
    var asBool: Bool { return self == .yes }
}

