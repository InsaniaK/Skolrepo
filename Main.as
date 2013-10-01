package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jonas Isaksson TE12D
	 */
	public class Main extends Sprite 
	{
		//PlayerStats - I nuläget hade dessa kunnat vara konstanter men i ett faktiskt spel skulle de vara variabler.
		var playerAttack:int = 20;
		var playerDamage:int = 20;
		var playerHp:int = 125;
		var playerDef:int = 38;
		//MonsterStats
		var monsterAttack:int = 15;
		var monsterDamage:int = 45
		var monsterHp:int = 75;
		var monsterDef:int = 15;
		//Textboxes - gameEndBox announcar vinnaren.
		var gameEndBox:TextField = new TextField;
		var textBox:TextField = new TextField;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var textBox:TextField = new TextField;
			textBox.border = true;
			textBox.width = 250;
			textBox.height = 350;
			textBox.x = stage.stageWidth / 2 - 125;
			
			for (var i:int = 1; i <=5 ; i++) 
			{
				var playerDamageTaken:int = monsterDamage-playerDef;
				var monsterDamageTaken:int = playerDamage-monsterDef;
				playerDamageTaken *= Math.random() * 6;
				monsterDamageTaken *= Math.random() * 4;
				playerHp -= playerDamageTaken;
				monsterHp -= monsterDamageTaken;
				textBox.appendText("Round " + i + "\n" + "Monster hits for " + String(playerDamageTaken) + ", Player has " + String(playerHp) + " HP left.\n");
				textBox.appendText("Player hits for " + String(monsterDamageTaken) + ", Monster has " + String(monsterHp) + " HP left.\n\n");	
			}
			if (playerHp>monsterHp) 
			{
				gameEndBox.text = "Player wins!"
			}
			else 
			{
				gameEndBox.text = "Monster wins!"
			}
			
			addChild(textBox);
			addChild(gameEndBox);
		}
		
	}
	
}