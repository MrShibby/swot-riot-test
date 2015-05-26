<item-list>

	<div class="swotboard__cell col-lg-6">
		<div id="strengths" class={panelClass}>
			<div class="panel-heading">
				<p class="panel-title"><strong>{title}</strong> ({ items.length})</p>
			</div>
			<div class="panel-body">
				<ul class="list-group">
					<li each="{text in items}" class="list-group-item">
						{ text }
						<span onclick={parent.remove} class="action-delete">									
							<i class="glyphicon glyphicon-remove"></i>
						</span>
					</li>
				</ul>
				<form onsubmit={add}>
					<input class="new-item" type="text" placeholder="New...">
				</form>
			</div>
		</div>
	</div>

	<script>

		this.title = '';
		this.context = '';
		this.panelClass = '';

		this.items = [];

		var self = this;

		// Add a item to the list
		//=======================
		add(event) {
			event.preventDefault();

			var text = event.target[0];
			var val = text.value;

			if(val != "") {
				self.items.push(val);
				text.value = "";
				storage.push(self.context, val);
			}
		};

		// Remove a item from the list
		//============================
		remove(event) {
			item = event.item;
			var index = self.items.indexOf(item.text);
			self.items.splice(index, 1);
			storage.unset(self.context, index);
		};


		// Tag initialization
		//===================
		this.on('mount', function() {

			var context = opts.context;

			self.context = context; // Get the context
			self.title = context.charAt(0).toUpperCase() + context.slice(1); // First letter to uppercase 
			self.panelClass = 'panel panel-' +  opts.color; // Get the boostrap panel class

			self.items = storage.get(context, []); // Get the item list of the context

		});

	</script>

</item-list>
