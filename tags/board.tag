<board>
	
	<div id="board" class="row swotboard">
	
		<div class="col-lg-4 col-lg-offset-4">
			<div show={!editing}>
				<h1 ondblclick={switchEdit}>{ boardTitle }</h1>			
			</div>
			<div show={editing}>
				<form onsubmit={changeTitle}>
					<input class="edit-title" type="text" value={boardTitle}>				
				</form>
			</div>
		</div>

		<div class="swotboard__container col-lg-12">
			
			<item-list color="primary" context="strenghts"></item-list>
			<item-list color="warning" context="weeknesses"></item-list>
			<item-list color="success" context="opportunities"></item-list>
			<item-list color="danger"  context="threats"></item-list>

		</div>

	</div>

	<script>


		this.boardTitle = opts.boardTitle;
		this.editing = false;

		var self = this;

		switchEdit() {
			self.editing = true;
		}

		changeTitle(event) {

			event.preventDefault();

			var text = event.target[0];
			var val = text.value;
			
			if(val != "") {
				self.boardTitle = val;				
				storage.set('boardtitle', val);
			}

			self.editing = false;
		}

	</script>

</board>