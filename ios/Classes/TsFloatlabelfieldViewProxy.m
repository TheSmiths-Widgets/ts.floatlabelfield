
#import "TsFloatlabelfieldViewProxy.h"
#import "TsFloatlabelfieldView.h"
@implementation TsFloatlabelfieldViewProxy

-(void)viewDidAttach
{
    ENSURE_UI_THREAD_0_ARGS;
    TsFloatlabelfieldView * view = (TsFloatlabelfieldView *)[self view];
}


-(void)setValue:(id)text
{
    ENSURE_STRING(text);
    [(TsFloatlabelfieldView*)[self view] performSelectorOnMainThread:@selector(setValue:)
                                                          withObject:text waitUntilDone:NO];
}
-(NSString *)value
{
    return [(TsFloatlabelfieldView*)[self view] getValue];
}

@end