function makeNoteDom(d, c, a) {
  var b = document.createElement("div");
  d = document.createTextNode(d);
  b.appendChild(d);
  d = document.createElement("div");
  c = document.createTextNode(c);
  d.appendChild(c);
  c = document.createElement("div");
  c.appendChild(b);
  c.appendChild(d);
  a.appendChild(c);
}
function makeNotes(d, c) {
  for (var a = 0;a < d.length;a++) {
    makeNoteDom(d[a].title, d[a].content, c);
  }
}
function main() {
  var d = document.getElementById("notes");
  makeNotes([{title:"Note 1", content:"Content of Note 1"}, {title:"Note 2", content:"Content of Note 2"}], d);
}
main();
(function(d) {
  var c = {init:function(a) {
    return this.each(function() {
      this.self = d(this);
      c.destroy.call(this.self);
      this.opt = d.extend(!0, {}, d.fn.raty.defaults, a);
      c._adjustCallback.call(this);
      c._adjustNumber.call(this);
      c._adjustHints.call(this);
      this.opt.score = c._adjustedScore.call(this, this.opt.score);
      "img" !== this.opt.starType && c._adjustStarType.call(this);
      c._adjustPath.call(this);
      c._createStars.call(this);
      this.opt.cancel && c._createCancel.call(this);
      this.opt.precision && c._adjustPrecision.call(this);
      c._createScore.call(this);
      c._apply.call(this, this.opt.score);
      c._setTitle.call(this, this.opt.score);
      c._target.call(this, this.opt.score);
      this.opt.readOnly ? c._lock.call(this) : (this.style.cursor = "pointer", c._binds.call(this));
    });
  }, _adjustCallback:function() {
    for (var a = ["number", "readOnly", "score", "scoreName", "target"], b = 0;b < a.length;b++) {
      "function" === typeof this.opt[a[b]] && (this.opt[a[b]] = this.opt[a[b]].call(this));
    }
  }, _adjustedScore:function(a) {
    return a ? c._between(a, 0, this.opt.number) : a;
  }, _adjustHints:function() {
    this.opt.hints || (this.opt.hints = []);
    if (this.opt.halfShow || this.opt.half) {
      for (var a = this.opt.precision ? 10 : 2, b = 0;b < this.opt.number;b++) {
        var c = this.opt.hints[b];
        "[object Array]" !== Object.prototype.toString.call(c) && (c = [c]);
        this.opt.hints[b] = [];
        for (var f = 0;f < a;f++) {
          var d = c[f], g = c[c.length - 1];
          void 0 === g && (g = null);
          this.opt.hints[b][f] = void 0 === d ? g : d;
        }
      }
    }
  }, _adjustNumber:function() {
    this.opt.number = c._between(this.opt.number, 1, this.opt.numberMax);
  }, _adjustPath:function() {
    this.opt.path = this.opt.path || "";
    this.opt.path && "/" !== this.opt.path.charAt(this.opt.path.length - 1) && (this.opt.path += "/");
  }, _adjustPrecision:function() {
    this.opt.half = !0;
  }, _adjustStarType:function() {
    var a = ["cancelOff", "cancelOn", "starHalf", "starOff", "starOn"];
    this.opt.path = "";
    for (var b = 0;b < a.length;b++) {
      this.opt[a[b]] = this.opt[a[b]].replace(".", "-");
    }
  }, _apply:function(a) {
    c._fill.call(this, a);
    a && (0 < a && this.score.val(a), c._roundStars.call(this, a));
  }, _between:function(a, b, c) {
    return Math.min(Math.max(parseFloat(a), b), c);
  }, _binds:function() {
    this.cancel && (c._bindOverCancel.call(this), c._bindClickCancel.call(this), c._bindOutCancel.call(this));
    c._bindOver.call(this);
    c._bindClick.call(this);
    c._bindOut.call(this);
  }, _bindClick:function() {
    var a = this;
    a.stars.on("click.raty", function(b) {
      var e = !0, f = a.opt.half || a.opt.precision ? a.self.data("score") : this.alt || d(this).data("alt");
      a.opt.click && (e = a.opt.click.call(a, +f, b));
      if (e || void 0 === e) {
        a.opt.half && !a.opt.precision && (f = c._roundHalfScore.call(a, f)), c._apply.call(a, f);
      }
    });
  }, _bindClickCancel:function() {
    var a = this;
    a.cancel.on("click.raty", function(b) {
      a.score.removeAttr("value");
      a.opt.click && a.opt.click.call(a, null, b);
    });
  }, _bindOut:function() {
    var a = this;
    a.self.on("mouseleave.raty", function(b) {
      var e = +a.score.val() || void 0;
      c._apply.call(a, e);
      c._target.call(a, e, b);
      c._resetTitle.call(a);
      a.opt.mouseout && a.opt.mouseout.call(a, e, b);
    });
  }, _bindOutCancel:function() {
    var a = this;
    a.cancel.on("mouseleave.raty", function(b) {
      var e = a.opt.cancelOff;
      "img" !== a.opt.starType && (e = a.opt.cancelClass + " " + e);
      c._setIcon.call(a, this, e);
      a.opt.mouseout && (e = +a.score.val() || void 0, a.opt.mouseout.call(a, e, b));
    });
  }, _bindOver:function() {
    var a = this;
    a.stars.on(a.opt.half ? "mousemove.raty" : "mouseover.raty", function(b) {
      var e = c._getScoreByPosition.call(a, b, this);
      c._fill.call(a, e);
      a.opt.half && (c._roundStars.call(a, e, b), c._setTitle.call(a, e, b), a.self.data("score", e));
      c._target.call(a, e, b);
      a.opt.mouseover && a.opt.mouseover.call(a, e, b);
    });
  }, _bindOverCancel:function() {
    var a = this;
    a.cancel.on("mouseover.raty", function(b) {
      var e = a.opt.path + a.opt.starOff, d = a.opt.cancelOn;
      "img" === a.opt.starType ? a.stars.attr("src", e) : (d = a.opt.cancelClass + " " + d, a.stars.attr("class", e));
      c._setIcon.call(a, this, d);
      c._target.call(a, null, b);
      a.opt.mouseover && a.opt.mouseover.call(a, null);
    });
  }, _buildScoreField:function() {
    return d("<input />", {name:this.opt.scoreName, type:"hidden"}).appendTo(this);
  }, _createCancel:function() {
    var a = this.opt.path + this.opt.cancelOff, b = d("<" + this.opt.starType + " />", {title:this.opt.cancelHint, "class":this.opt.cancelClass});
    "img" === this.opt.starType ? b.attr({src:a, alt:"x"}) : b.attr("data-alt", "x").addClass(a);
    "left" === this.opt.cancelPlace ? this.self.prepend("&#160;").prepend(b) : this.self.append("&#160;").append(b);
    this.cancel = b;
  }, _createScore:function() {
    var a = d(this.opt.targetScore);
    this.score = a.length ? a : c._buildScoreField.call(this);
  }, _createStars:function() {
    for (var a = 1;a <= this.opt.number;a++) {
      var b = c._nameForIndex.call(this, a), b = {alt:a, src:this.opt.path + this.opt[b]};
      "img" !== this.opt.starType && (b = {"data-alt":a, "class":b.src});
      b.title = c._getHint.call(this, a);
      d("<" + this.opt.starType + " />", b).appendTo(this);
      this.opt.space && this.self.append(a < this.opt.number ? "&#160;" : "");
    }
    this.stars = this.self.children(this.opt.starType);
  }, _error:function(a) {
    d(this).text(a);
    d.error(a);
  }, _fill:function(a) {
    for (var b = 0, e = 1;e <= this.stars.length;e++) {
      var d, h = this.stars[e - 1];
      d = c._turnOn.call(this, e, a);
      if (this.opt.iconRange && this.opt.iconRange.length > b) {
        var g = this.opt.iconRange[b];
        d = c._getRangeIcon.call(this, g, d);
        e <= g.range && c._setIcon.call(this, h, d);
        e === g.range && b++;
      } else {
        d = this.opt[d ? "starOn" : "starOff"], c._setIcon.call(this, h, d);
      }
    }
  }, _getFirstDecimal:function(a) {
    a = a.toString().split(".")[1];
    var b = 0;
    a && (b = parseInt(a.charAt(0), 10), "9999" === a.slice(1, 5) && b++);
    return b;
  }, _getRangeIcon:function(a, b) {
    return b ? a.on || this.opt.starOn : a.off || this.opt.starOff;
  }, _getScoreByPosition:function(a, b) {
    var e = parseInt(b.alt || b.getAttribute("data-alt"), 10);
    if (this.opt.half) {
      var f = c._getWidth.call(this), f = parseFloat((a.pageX - d(b).offset().left) / f), e = e - 1 + f
    }
    return e;
  }, _getHint:function(a, b) {
    if (0 !== a && !a) {
      return this.opt.noRatedMsg;
    }
    var e = c._getFirstDecimal.call(this, a), d = this.opt.hints[(Math.ceil(a) || 1) - 1], h = d, g = !b || this.move;
    if (this.opt.precision) {
      g && (e = 0 === e ? 9 : e - 1), h = d[e];
    } else {
      if (this.opt.halfShow || this.opt.half) {
        h = d[g && 0 === e ? 1 : 5 < e ? 1 : 0];
      }
    }
    return "" === h ? "" : h || a;
  }, _getWidth:function() {
    var a = this.stars[0].width || parseFloat(this.stars.eq(0).css("font-size"));
    a || c._error.call(this, "Could not get the icon width!");
    return a;
  }, _lock:function() {
    var a = c._getHint.call(this, this.score.val());
    this.style.cursor = "";
    this.title = a;
    this.score.prop("readonly", !0);
    this.stars.prop("title", a);
    this.cancel && this.cancel.hide();
    this.self.data("readonly", !0);
  }, _nameForIndex:function(a) {
    return this.opt.score && this.opt.score >= a ? "starOn" : "starOff";
  }, _resetTitle:function(a) {
    for (a = 0;a < this.opt.number;a++) {
      this.stars[a].title = c._getHint.call(this, a + 1);
    }
  }, _roundHalfScore:function(a) {
    var b = parseInt(a, 10);
    a = c._getFirstDecimal.call(this, a);
    0 !== a && (a = 5 < a ? 1 : .5);
    return b + a;
  }, _roundStars:function(a, b) {
    var d = (a % 1).toFixed(2), f;
    b || this.move ? f = .5 < d ? "starOn" : "starHalf" : d > this.opt.round.down && (f = "starOn", this.opt.halfShow && d < this.opt.round.up ? f = "starHalf" : d < this.opt.round.full && (f = "starOff"));
    f && c._setIcon.call(this, this.stars[Math.ceil(a) - 1], this.opt[f]);
  }, _setIcon:function(a, b) {
    a["img" === this.opt.starType ? "src" : "className"] = this.opt.path + b;
  }, _setTarget:function(a, b) {
    b && (b = this.opt.targetFormat.toString().replace("{score}", b));
    a.is(":input") ? a.val(b) : a.html(b);
  }, _setTitle:function(a, b) {
    if (a) {
      var d = parseInt(Math.ceil(a), 10);
      this.stars[d - 1].title = c._getHint.call(this, a, b);
    }
  }, _target:function(a, b) {
    if (this.opt.target) {
      var e = d(this.opt.target);
      e.length || c._error.call(this, "Target selector invalid or missing!");
      var f = b && "mouseover" === b.type;
      if (void 0 === a) {
        a = this.opt.targetText;
      } else {
        if (null === a) {
          a = f ? this.opt.cancelHint : this.opt.targetText;
        } else {
          "hint" === this.opt.targetType ? a = c._getHint.call(this, a, b) : this.opt.precision && (a = parseFloat(a).toFixed(1));
          var h = b && "mousemove" === b.type;
          f || h || this.opt.targetKeep || (a = this.opt.targetText);
        }
      }
      c._setTarget.call(this, e, a);
    }
  }, _turnOn:function(a, b) {
    return this.opt.single ? a === b : a <= b;
  }, _unlock:function() {
    this.style.cursor = "pointer";
    this.removeAttribute("title");
    this.score.removeAttr("readonly");
    this.self.data("readonly", !1);
    for (var a = 0;a < this.opt.number;a++) {
      this.stars[a].title = c._getHint.call(this, a + 1);
    }
    this.cancel && this.cancel.css("display", "");
  }, cancel:function(a) {
    return this.each(function() {
      var b = d(this);
      !0 !== b.data("readonly") && (c[a ? "click" : "score"].call(b, null), this.score.removeAttr("value"));
    });
  }, click:function(a) {
    return this.each(function() {
      !0 !== d(this).data("readonly") && (a = c._adjustedScore.call(this, a), c._apply.call(this, a), this.opt.click && this.opt.click.call(this, a, d.Event("click")), c._target.call(this, a));
    });
  }, destroy:function() {
    return this.each(function() {
      var a = d(this), b = a.data("raw");
      b ? a.off(".raty").empty().css({cursor:b.style.cursor}).removeData("readonly") : a.data("raw", a.clone()[0]);
    });
  }, getScore:function() {
    var a = [], b;
    this.each(function() {
      b = this.score.val();
      a.push(b ? +b : void 0);
    });
    return 1 < a.length ? a : a[0];
  }, move:function(a) {
    return this.each(function() {
      var b = parseInt(a, 10), e = c._getFirstDecimal.call(this, a);
      b >= this.opt.number && (b = this.opt.number - 1, e = 10);
      var f = c._getWidth.call(this) / 10, b = d(this.stars[b]), e = b.offset().left + f * e, e = d.Event("mousemove", {pageX:e});
      this.move = !0;
      b.trigger(e);
      this.move = !1;
    });
  }, readOnly:function(a) {
    return this.each(function() {
      var b = d(this);
      b.data("readonly") !== a && (a ? (b.off(".raty").children("img").off(".raty"), c._lock.call(this)) : (c._binds.call(this), c._unlock.call(this)), b.data("readonly", a));
    });
  }, reload:function() {
    return c.set.call(this, {});
  }, score:function() {
    var a = d(this);
    return arguments.length ? c.setScore.apply(a, arguments) : c.getScore.call(a);
  }, set:function(a) {
    return this.each(function() {
      d(this).raty(d.extend({}, this.opt, a));
    });
  }, setScore:function(a) {
    return this.each(function() {
      !0 !== d(this).data("readonly") && (a = c._adjustedScore.call(this, a), c._apply.call(this, a), c._target.call(this, a));
    });
  }};
  d.fn.raty = function(a) {
    if (c[a]) {
      return c[a].apply(this, Array.prototype.slice.call(arguments, 1));
    }
    if ("object" !== typeof a && a) {
      d.error("Method " + a + " does not exist!");
    } else {
      return c.init.apply(this, arguments);
    }
  };
  d.fn.raty.defaults = {cancel:!1, cancelClass:"raty-cancel", cancelHint:"Cancel this rating!", cancelOff:"cancel-off.png", cancelOn:"cancel-on.png", cancelPlace:"left", click:void 0, half:!1, halfShow:!0, hints:["bad", "poor", "regular", "good", "gorgeous"], iconRange:void 0, mouseout:void 0, mouseover:void 0, noRatedMsg:"Not rated yet!", number:5, numberMax:20, path:void 0, precision:!1, readOnly:!1, round:{down:.25, full:.6, up:.76}, score:void 0, scoreName:"score", single:!1, space:!0, starHalf:"star-half.png",
  starOff:"star-off.png", starOn:"star-on.png", starType:"img", target:void 0, targetFormat:"{score}", targetKeep:!1, targetScore:void 0, targetText:"", targetType:"hint"};
})(jQuery);
©2009 Google - Terms of Service - Privacy Policy - Google Home
