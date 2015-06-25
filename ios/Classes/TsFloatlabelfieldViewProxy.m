
#import "TsFloatlabelfieldViewProxy.h"
#import "TsFloatlabelfieldView.h"
@implementation TsFloatlabelfieldViewProxy

-(void)viewDidAttach
{
    ENSURE_UI_THREAD_0_ARGS;
    TsFloatlabelfieldView * view = (TsFloatlabelfieldView *)[self view];
}


@end