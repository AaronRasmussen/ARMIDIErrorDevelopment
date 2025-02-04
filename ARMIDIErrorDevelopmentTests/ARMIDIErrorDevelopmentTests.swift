//
//  ARMIDIErrorDevelopmentTests.swift
//  ARMIDIErrorDevelopmentTests
//
//  Created by Aaron Rasmussen on 2/3/25.
//

import Testing
import CoreMIDI
import ARMIDIError
import AudioToolbox

@testable import ARMIDIErrorDevelopment

let invalidASCIIValues = Set<UInt>(0...255).subtracting(32...127)

struct ARMIDIErrorDevelopmentTests {
    
    @Test func example() async throws {
        
        #expect(
            MIDIError(kMIDIIDNotUnique) == .IDNotUnique
        )
    }
    
    @Test func nilStatusDescription() async throws {
        
        #expect(
            MIDIError(kAudioFormatUnknownFormatError).statusDescription == "!fmt")
    }
    
    @Test func errorDescription() async throws {
        
        let errorString = "Error: The identifier you’re trying to set isn’t unique (OSStatus \(kMIDIIDNotUnique), kMIDIIDNotUnique)"
        
        #expect(
            MIDIError(kMIDIIDNotUnique).description == errorString
        )
    }
    
    @Test func undefinedErrorDescription() async throws {
        
        let errorString = "Error: OSStatus code not defined by CoreMIDI (OSStatus \(kAudioFormatUnknownFormatError), '!fmt')"
        
        #expect(
            MIDIError(kAudioFormatUnknownFormatError).description == errorString
        )
    }
    
    @Test func undefinedErrorNoDescription() async throws {
        
        let errorString = "Error: OSStatus code not defined by CoreMIDI (OSStatus \(0), no description available)"
        
        #expect(
            MIDIError(0).description == errorString
        )
    }
    
    @Test func asciiTest() async {
        #expect(Int32(0x20202020).statusDescription != nil)
    }
}
