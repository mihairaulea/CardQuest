package view 
{
	import com.gskinner.motion.easing.Cubic;
	import starling.display.Sprite;
	import starling.events.Event;
	import view.screens.BonusLevelScreen;
	import view.screens.FeedbackScreen;
	import view.screens.FirstScreen;
	import view.screens.GameScreen;
	import view.screens.LevelBrowser;
	import view.screens.StatsScreen;
	import view.screens.WorldBrowser;
	import view.util.ContentManipulator;
	import view.util.ContentRequester;
	import view.util.ContentTransition;

	public class View extends Sprite
	{
		private static const FIRST_SCREEN:String = "firstScreen";
		private static const WORLD_BROWSER:String = "worldBrowser";
		private static const LEVEL_BROWSER:String = "levelBrowser";
		private static const GAME_SCREEN:String = "gameScreen";
		private static const BONUS_LEVEL:String = "bonusLevel";
		private static const FEEDBACK_SCREEN:String = "victoryScreen";
		private static const STATS_SCREEN:String = "statsScreen";

		//private var theme:???;
		private var transitionManager:ContentTransition;
		private var navigator:ContentManipulator;
		
		public function View() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler);
		}
		
		private function onAddedToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStageHandler);
			
			//this.theme = new ???;
			
			// TODO: FIX - NAVIGATOR NU AFISEAZA ULTIMU ECRAN CU SHOW SCREEN! :)
			this.navigator = new ContentManipulator();
			addChild(this.navigator);
			
			this.navigator.addScreen(FIRST_SCREEN, new ContentRequester(FirstScreen,
			{
				onPlay: WORLD_BROWSER,
				onCredits: LEVEL_BROWSER,
				onStats: STATS_SCREEN
			}));
			
			this.navigator.addScreen(WORLD_BROWSER, new ContentRequester(WorldBrowser,
			{
				onBack: FIRST_SCREEN,
				onWorld: LEVEL_BROWSER
			}));
			
			this.navigator.addScreen(LEVEL_BROWSER, new ContentRequester(LevelBrowser,
			{
				
			}));
			
			this.navigator.addScreen(GAME_SCREEN, new ContentRequester(GameScreen,
			{
				
			}));
			
			this.navigator.addScreen(BONUS_LEVEL, new ContentRequester(BonusLevelScreen,
			{
				
			}));
			
			this.navigator.addScreen(FEEDBACK_SCREEN, new ContentRequester(FeedbackScreen,
			{
				
			}));
			
			this.navigator.addScreen(STATS_SCREEN, new ContentRequester(StatsScreen,
			{
				
			}));
			
			this.navigator.showScreen(FIRST_SCREEN);
			
			transitionManager = new ContentTransition(this.navigator);
			transitionManager.duration = 0.4;
			transitionManager.ease = Cubic.easeOut;
			
		}
		
	}

}