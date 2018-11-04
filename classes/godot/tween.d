/**
Smoothly animates a node's properties over time.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.tween;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.meta;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.object;
import godot.classdb;
import godot.node;
/**
Smoothly animates a node's properties over time.

Tweens are useful for animations requiring a numerical property to be interpolated over a range of values. The name *tween* comes from *in-betweening*, an animation technique where you specify *keyframes* and the computer interpolates the frames that appear between them.
Here is a brief usage example that causes a 2D node to move smoothly between two positions:


var tween = get_node("Tween")
tween.interpolate_property($Node2D, "position",
        Vector2(0, 0), Vector2(100, 100), 1,
        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
tween.start()


Many methods require a property name, such as "position" above. You can find the correct property name by hovering over the property in the Inspector.
Many of the methods accept `trans_type` and `ease_type`. The first accepts an $(D transitiontype) constant, and refers to the way the timing of the animation is handled (see `http://easings.net/` for some examples). The second accepts an $(D easetype) constant, and controls the where `trans_type` is applied to the interpolation (in the beginning, the end, or both). If you don't know which transition and easing to pick, you can try different $(D transitiontype) constants with `EASE_IN_OUT`, and use the one that looks best.
*/
@GodotBaseClass struct Tween
{
	enum string _GODOT_internal_name = "Tween";
public:
@nogc nothrow:
	union { godot_object _godot_object; Node _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct _classBinding
	{
		__gshared:
		@GodotName("is_active") GodotMethod!(bool) isActive;
		@GodotName("set_active") GodotMethod!(void, bool) setActive;
		@GodotName("is_repeat") GodotMethod!(bool) isRepeat;
		@GodotName("set_repeat") GodotMethod!(void, bool) setRepeat;
		@GodotName("set_speed_scale") GodotMethod!(void, double) setSpeedScale;
		@GodotName("get_speed_scale") GodotMethod!(double) getSpeedScale;
		@GodotName("set_tween_process_mode") GodotMethod!(void, long) setTweenProcessMode;
		@GodotName("get_tween_process_mode") GodotMethod!(Tween.TweenProcessMode) getTweenProcessMode;
		@GodotName("start") GodotMethod!(bool) start;
		@GodotName("reset") GodotMethod!(bool, GodotObject, String) reset;
		@GodotName("reset_all") GodotMethod!(bool) resetAll;
		@GodotName("stop") GodotMethod!(bool, GodotObject, String) stop;
		@GodotName("stop_all") GodotMethod!(bool) stopAll;
		@GodotName("resume") GodotMethod!(bool, GodotObject, String) resume;
		@GodotName("resume_all") GodotMethod!(bool) resumeAll;
		@GodotName("remove") GodotMethod!(bool, GodotObject, String) remove;
		@GodotName("_remove_by_uid") GodotMethod!(void, long) _removeByUid;
		@GodotName("remove_all") GodotMethod!(bool) removeAll;
		@GodotName("seek") GodotMethod!(bool, double) seek;
		@GodotName("tell") GodotMethod!(double) tell;
		@GodotName("get_runtime") GodotMethod!(double) getRuntime;
		@GodotName("interpolate_property") GodotMethod!(bool, GodotObject, NodePath, Variant, Variant, double, long, long, double) interpolateProperty;
		@GodotName("interpolate_method") GodotMethod!(bool, GodotObject, String, Variant, Variant, double, long, long, double) interpolateMethod;
		@GodotName("interpolate_callback") GodotMethod!(bool, GodotObject, double, String, Variant, Variant, Variant, Variant, Variant) interpolateCallback;
		@GodotName("interpolate_deferred_callback") GodotMethod!(bool, GodotObject, double, String, Variant, Variant, Variant, Variant, Variant) interpolateDeferredCallback;
		@GodotName("follow_property") GodotMethod!(bool, GodotObject, NodePath, Variant, GodotObject, NodePath, double, long, long, double) followProperty;
		@GodotName("follow_method") GodotMethod!(bool, GodotObject, String, Variant, GodotObject, String, double, long, long, double) followMethod;
		@GodotName("targeting_property") GodotMethod!(bool, GodotObject, NodePath, GodotObject, NodePath, Variant, double, long, long, double) targetingProperty;
		@GodotName("targeting_method") GodotMethod!(bool, GodotObject, String, GodotObject, String, Variant, double, long, long, double) targetingMethod;
	}
	bool opEquals(in Tween other) const { return _godot_object.ptr is other._godot_object.ptr; }
	Tween opAssign(T : typeof(null))(T n) { _godot_object.ptr = null; }
	bool opEquals(typeof(null) n) const { return _godot_object.ptr is null; }
	mixin baseCasts;
	static Tween _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("Tween");
		if(constructor is null) return typeof(this).init;
		return cast(Tween)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum TransitionType : int
	{
		/**
		The animation is interpolated linearly.
		*/
		transLinear = 0,
		/**
		The animation is interpolated using a sine function.
		*/
		transSine = 1,
		/**
		The animation is interpolated with a quintic (to the power of 5) function.
		*/
		transQuint = 2,
		/**
		The animation is interpolated with a quartic (to the power of 4) function.
		*/
		transQuart = 3,
		/**
		The animation is interpolated with a quadratic (to the power of 2) function.
		*/
		transQuad = 4,
		/**
		The animation is interpolated with an exponential (to the power of x) function.
		*/
		transExpo = 5,
		/**
		The animation is interpolated with elasticity, wiggling around the edges.
		*/
		transElastic = 6,
		/**
		The animation is interpolated with a cubic (to the power of 3) function.
		*/
		transCubic = 7,
		/**
		The animation is interpolated with a function using square roots.
		*/
		transCirc = 8,
		/**
		The animation is interpolated by bouncing at the end.
		*/
		transBounce = 9,
		/**
		The animation is interpolated backing out at ends.
		*/
		transBack = 10,
	}
	/// 
	enum TweenProcessMode : int
	{
		/**
		The tween updates with the `_physics_process` callback.
		*/
		tweenProcessPhysics = 0,
		/**
		The tween updates with the `_process` callback.
		*/
		tweenProcessIdle = 1,
	}
	/// 
	enum EaseType : int
	{
		/**
		The interpolation starts slowly and speeds up towards the end.
		*/
		easeIn = 0,
		/**
		The interpolation starts quickly and slows down towards the end.
		*/
		easeOut = 1,
		/**
		A combination of EASE_IN and EASE_OUT. The interpolation is slowest at both ends.
		*/
		easeInOut = 2,
		/**
		A combination of EASE_IN and EASE_OUT. The interpolation is fastest at both ends.
		*/
		easeOutIn = 3,
	}
	/// 
	enum Constants : int
	{
		easeIn = 0,
		tweenProcessPhysics = 0,
		transLinear = 0,
		transSine = 1,
		tweenProcessIdle = 1,
		easeOut = 1,
		easeInOut = 2,
		transQuint = 2,
		easeOutIn = 3,
		transQuart = 3,
		transQuad = 4,
		transExpo = 5,
		transElastic = 6,
		transCubic = 7,
		transCirc = 8,
		transBounce = 9,
		transBack = 10,
	}
	/**
	Returns `true` if any tweens are currently running. Note that this method doesn't consider tweens that have ended.
	*/
	bool isActive() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.isActive, _godot_object);
	}
	/**
	Activates/deactivates the tween. See also $(D stopAll) and $(D resumeAll).
	*/
	void setActive(in bool active)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setActive, _godot_object, active);
	}
	/**
	
	*/
	bool isRepeat() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.isRepeat, _godot_object);
	}
	/**
	
	*/
	void setRepeat(in bool repeat)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setRepeat, _godot_object, repeat);
	}
	/**
	
	*/
	void setSpeedScale(in double speed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setSpeedScale, _godot_object, speed);
	}
	/**
	
	*/
	double getSpeedScale() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(_classBinding.getSpeedScale, _godot_object);
	}
	/**
	
	*/
	void setTweenProcessMode(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(_classBinding.setTweenProcessMode, _godot_object, mode);
	}
	/**
	
	*/
	Tween.TweenProcessMode getTweenProcessMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Tween.TweenProcessMode)(_classBinding.getTweenProcessMode, _godot_object);
	}
	/**
	Starts the tween. You can define animations both before and after this.
	*/
	bool start()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.start, _godot_object);
	}
	/**
	Resets a tween to its initial value (the one given, not the one before the tween), given its object and property/method pair. By default, all tweens are removed, unless `key` is specified.
	*/
	bool reset(GodotObject object, in String key = gs!"")
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.reset, _godot_object, object, key);
	}
	/**
	Resets all tweens to their initial values (the ones given, not those before the tween).
	*/
	bool resetAll()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.resetAll, _godot_object);
	}
	/**
	Stops a tween, given its object and property/method pair. By default, all tweens are stopped, unless `key` is specified.
	*/
	bool stop(GodotObject object, in String key = gs!"")
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.stop, _godot_object, object, key);
	}
	/**
	Stops animating all tweens.
	*/
	bool stopAll()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.stopAll, _godot_object);
	}
	/**
	Continues animating a stopped tween, given its object and property/method pair. By default, all tweens are resumed, unless `key` is specified.
	*/
	bool resume(GodotObject object, in String key = gs!"")
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.resume, _godot_object, object, key);
	}
	/**
	Continues animating all stopped tweens.
	*/
	bool resumeAll()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.resumeAll, _godot_object);
	}
	/**
	Stops animation and removes a tween, given its object and property/method pair. By default, all tweens are removed, unless `key` is specified.
	*/
	bool remove(GodotObject object, in String key = gs!"")
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.remove, _godot_object, object, key);
	}
	/**
	
	*/
	void _removeByUid(in long uid)
	{
		Array _GODOT_args = Array.empty_array;
		_GODOT_args.append(uid);
		String _GODOT_method_name = String("_remove_by_uid");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	Stops animation and removes all tweens.
	*/
	bool removeAll()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.removeAll, _godot_object);
	}
	/**
	Sets the interpolation to the given `time` in seconds.
	*/
	bool seek(in double time)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.seek, _godot_object, time);
	}
	/**
	Returns the current time of the tween.
	*/
	double tell() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(_classBinding.tell, _godot_object);
	}
	/**
	Returns the total time needed for all tweens to end. If you have two tweens, one lasting 10 seconds and the other 20 seconds, it would return 20 seconds, as by that time all tweens would have finished.
	*/
	double getRuntime() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(_classBinding.getRuntime, _godot_object);
	}
	/**
	Animates `property` of `object` from `initial_val` to `final_val` for `duration` seconds, `delay` seconds later. Setting the initial value to `null` uses the current value of the property.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool interpolateProperty(NodePathArg1, VariantArg2, VariantArg3)(GodotObject object, in NodePathArg1 property, in VariantArg2 initial_val, in VariantArg3 final_val, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.interpolateProperty, _godot_object, object, property, initial_val, final_val, duration, trans_type, ease_type, delay);
	}
	/**
	Animates `method` of `object` from `initial_val` to `final_val` for `duration` seconds, `delay` seconds later. Methods are called with consecutive values.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool interpolateMethod(VariantArg2, VariantArg3)(GodotObject object, in String method, in VariantArg2 initial_val, in VariantArg3 final_val, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.interpolateMethod, _godot_object, object, method, initial_val, final_val, duration, trans_type, ease_type, delay);
	}
	/**
	Calls `callback` of `object` after `duration`. `arg1`-`arg5` are arguments to be passed to the callback.
	*/
	bool interpolateCallback(VariantArg3, VariantArg4, VariantArg5, VariantArg6, VariantArg7)(GodotObject object, in double duration, in String callback, in VariantArg3 arg1 = Variant.nil, in VariantArg4 arg2 = Variant.nil, in VariantArg5 arg3 = Variant.nil, in VariantArg6 arg4 = Variant.nil, in VariantArg7 arg5 = Variant.nil)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.interpolateCallback, _godot_object, object, duration, callback, arg1, arg2, arg3, arg4, arg5);
	}
	/**
	Calls `callback` of `object` after `duration` on the main thread (similar to $(D GodotObject.callDeferred)). `arg1`-`arg5` are arguments to be passed to the callback.
	*/
	bool interpolateDeferredCallback(VariantArg3, VariantArg4, VariantArg5, VariantArg6, VariantArg7)(GodotObject object, in double duration, in String callback, in VariantArg3 arg1 = Variant.nil, in VariantArg4 arg2 = Variant.nil, in VariantArg5 arg3 = Variant.nil, in VariantArg6 arg4 = Variant.nil, in VariantArg7 arg5 = Variant.nil)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.interpolateDeferredCallback, _godot_object, object, duration, callback, arg1, arg2, arg3, arg4, arg5);
	}
	/**
	Follows `property` of `object` and applies it on `target_property` of `target`, beginning from `initial_val` for `duration` seconds, `delay` seconds later.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool followProperty(NodePathArg1, VariantArg2, NodePathArg4)(GodotObject object, in NodePathArg1 property, in VariantArg2 initial_val, GodotObject target, in NodePathArg4 target_property, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.followProperty, _godot_object, object, property, initial_val, target, target_property, duration, trans_type, ease_type, delay);
	}
	/**
	Follows `method` of `object` and applies the returned value on `target_method` of `target`, beginning from `initial_val` for `duration` seconds, `delay` later. Methods are called with consecutive values.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool followMethod(VariantArg2)(GodotObject object, in String method, in VariantArg2 initial_val, GodotObject target, in String target_method, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.followMethod, _godot_object, object, method, initial_val, target, target_method, duration, trans_type, ease_type, delay);
	}
	/**
	Animates `property` of `object` from the current value of the `initial_val` property of `initial` to `final_val` for `duration` seconds, `delay` seconds later.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool targetingProperty(NodePathArg1, NodePathArg3, VariantArg4)(GodotObject object, in NodePathArg1 property, GodotObject initial, in NodePathArg3 initial_val, in VariantArg4 final_val, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.targetingProperty, _godot_object, object, property, initial, initial_val, final_val, duration, trans_type, ease_type, delay);
	}
	/**
	Animates `method` of `object` from the value returned by `initial_method` to `final_val` for `duration` seconds, `delay` seconds later. Methods are animated by calling them with consecutive values.
	Use $(D transitiontype) for `trans_type` and $(D easetype) for `ease_type` parameters. These values control the timing and direction of the interpolation. See the class description for more information
	*/
	bool targetingMethod(VariantArg4)(GodotObject object, in String method, GodotObject initial, in String initial_method, in VariantArg4 final_val, in double duration, in long trans_type, in long ease_type, in double delay = 0)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(_classBinding.targetingMethod, _godot_object, object, method, initial, initial_method, final_val, duration, trans_type, ease_type, delay);
	}
	/**
	If `true` the tween loops.
	*/
	@property bool repeat()
	{
		return isRepeat();
	}
	/// ditto
	@property void repeat(bool v)
	{
		setRepeat(v);
	}
	/**
	The tween's animation process thread. See $(D tweenprocessmode). Default value: $(D tweenProcessIdle).
	*/
	@property Tween.TweenProcessMode playbackProcessMode()
	{
		return getTweenProcessMode();
	}
	/// ditto
	@property void playbackProcessMode(long v)
	{
		setTweenProcessMode(v);
	}
	/**
	The tween's speed multiplier. For example, set it to `1.0` for normal speed, `2.0` for two times normal speed, or `0.5` for half of the normal speed. A value of `0` pauses the animation, but see also $(D setActive) or $(D stopAll) for this.
	*/
	@property double playbackSpeed()
	{
		return getSpeedScale();
	}
	/// ditto
	@property void playbackSpeed(double v)
	{
		setSpeedScale(v);
	}
}
