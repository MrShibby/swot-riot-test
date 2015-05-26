// Local storage
//===============
var storage = {

	set: function(key, value) {
		if(typeof value === "object")
			value = JSON.stringify(value);
		return localStorage.setItem(key, value);
	},

	push: function(key, value) {

		existing = this.get(key);
		
		if(existing && typeof(existing === "object")) {
			existing.push(value);
			this.set(key, existing);
		} else {
			value = [value];
			this.set(key, value);
		}

	},


	get: function(key, defaultValue) {
		value = this._parseIfJSON(localStorage.getItem(key));
		if(value == null && typeof defaultValue != undefined)
			return defaultValue
		return value;
	},

	remove: function(key) {
		return localStorage.removeItem(key);
	},

	unset: function(key, index) {
		var list = this.get(key);
		if(typeof list === "object") {
			if(index != -1) {
				list.splice(index, 1);
				console.log(list);
				this.set(key, list);
			}
		}
	},

	key: function(index) {
		return localStorage.key(index);
	},

	clear: function() {
		return localStorage.clear();
	},

	_parseIfJSON: function(str) {
		try {
			str = JSON.parse(str);
		} catch (e) {
			return str;
		}
	return str;
	}
}