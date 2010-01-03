/* MidiController */

#import <Cocoa/Cocoa.h>
#include <AudioUnit/AudioUnit.h>
#include <AudioToolbox/AUGraph.h>

@interface MidiController : NSObject
{
  AUNode synthNode_;
  AUNode filterNode_;
  AUNode outputNode_;
  AUGraph graph_;
  UInt8 midiChannel_;
}

- (void) playPitch:(int)pitch withLength:(int)length;
@end
